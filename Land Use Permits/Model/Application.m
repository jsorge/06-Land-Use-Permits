#import "Application.h"
#import "Applicant.h"
#import "Property.h"

NSString *const fetchApplicationByPermitNumber = @"FetchApplicationByPermitNumber";
NSString *const applicationPermitToken = @"PERMIT_NUMBER";
NSString *const applicationEntityName = @"Application";

@interface Application ()
@property (strong, nonatomic)NSDateFormatter *dateFormatter;
@end


@implementation Application
@synthesize dateFormatter = _dateFormatter;

#pragma mark - Properties
- (NSDateFormatter *)dateFormatter
{
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        _dateFormatter.dateFormat =  @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'";
        _dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    }
    return _dateFormatter;
}

#pragma mark - Inserts
- (void)awakeFromInsert
{
    [super awakeFromInsert];
    self.applicationDate = [NSDate date];
    self.applicationDescription = @"A new permit";
    self.appealed = @0;
    self.category = @"Building";
    self.decisionType = @"Approval";
}

#pragma mark - API
+ (Application *)findOrCreateApplicationWithPermitNumber:(NSString *)permitNumber context:(NSManagedObjectContext *)context
{
    NSArray *applications = [Application applicationsWithPermitNumber:permitNumber context:context];
    Application *application = [applications lastObject];
    
    if (!application) {
        application = [NSEntityDescription insertNewObjectForEntityForName:applicationEntityName inManagedObjectContext:context];
        application.applicationPermitNumber = permitNumber;
    }
    return application;
}

+ (NSArray *)applicationsWithPermitNumber:(NSString *)permitNumber context:(NSManagedObjectContext *)context
{
    NSError *error;
    NSManagedObjectModel *model = context.persistentStoreCoordinator.managedObjectModel;
    
    NSFetchRequest *fetch = [model fetchRequestFromTemplateWithName:fetchApplicationByPermitNumber substitutionVariables:@{applicationPermitToken: permitNumber}];
    NSArray *fetchResult = [context executeFetchRequest:fetch error:&error];
    
    return fetchResult;
}

+ (NSString *)jsonDownloadURL
{
    return @"https://data.seattle.gov/api/views/uyyd-8gak/rows.json?accessType=DOWNLOAD";
}

+ (BOOL)repopulateWithData:(NSData *)data inContext:(NSManagedObjectContext *)context
{
    NSLog(@"parsing %ld bytes of data", data.length);
    NSDictionary *database;
    NSError *error;
    database = [NSJSONSerialization JSONObjectWithData:data
                                               options:kNilOptions
                                                 error:&error];
    if (!database) {
        NSLog(@"Error parsing data: %@", error.localizedDescription);
        return NO;
    }
    
    [self exploreDatabase:database];
    NSLog(@"data downloaded");
    
    int count = 0;
    for (NSArray *row in database[@"data"]) {
        NSLog(@"%d", count++);
        NSString *permitNumber = nil;
        NSString *address = nil;
        NSString *applicantName = nil;
        if (row[8] != [NSNull null]) {
            permitNumber = row[8];
        }
        if (row[10] != [NSNull null]) {
            address = row[10];
        }
        if (row[16] != [NSNull null]) {
            applicantName = row[16];
        }
        
        Application *application = [Application findOrCreateApplicationWithPermitNumber:permitNumber context:context];
        
        if (address) {
            Property *property = [Property findOrCreatePropertyWithAddress:address context:context];
            application.property = property;
        }
        
        if (applicantName) {
            Applicant *applicant = [Applicant findOrCreateApplicantWithName:applicantName context:context];
            application.applicant = applicant;
        }
        
        count++;
        if (count > 100) {
            NSError *saveError;
            if (![context save:&saveError]) {
                NSLog(@"Error while saving: %@", saveError.localizedDescription);
            }
            count = 0;
        }
        
    }
    
    NSLog(@"Core Data Insertions Finished");
    
    return YES;
}

#pragma mark - Starting Code
+ (void)exploreDatabase:(NSDictionary *)database
{
    NSArray *data = database[@"data"];
    NSDictionary *meta = database[@"meta"];
    NSLog(@"meta keys: %@", [meta allKeys]);
    NSDictionary *view = meta[@"view"];
    NSLog(@"view keys: %@", [view allKeys]);
    NSArray *columns = view[@"columns"];
    NSLog(@"columns are of class %@", columns.class);
    NSLog(@"column elements are of class %@", [columns[0] class]);
    NSDictionary *aColumnElement = columns[0];
    NSLog(@"column keys are: %@", [aColumnElement allKeys]);
    
    int columnCount = 0;
    NSLog(@"column values: position name description dataTypeName fieldName");
    for (NSDictionary *obj in columns) {
        columnCount ++;
        NSLog(@"column %d: %@ %@ %@ %@ %@", columnCount, obj[@"position"], obj[@"name"], obj[@"description"], obj[@"dataTypeName"], obj[@"fieldName"]);
    }
    NSLog(@"meta %@ %@", meta.class, meta.allKeys);
    NSLog(@"view %@ %@", view.class, view.allKeys);
    
    int j = 0;
    for (NSArray *row in data) {
        j++;
        int i = 0;
        for (id col in row) {
            NSLog(@"%d %@", i++, col);
        }
        if (j > 20) {
            break;
        }
    }
}

@end
