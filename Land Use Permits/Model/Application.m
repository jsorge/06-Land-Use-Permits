#import "Application.h"
#import "Applicant.h"
#import "Property.h"

NSString *const fetchApplicationByPermitNumber = @"FetchApplicationByPermitNumber";
NSString *const applicationPermitToken = @"PERMIT_NUMBER";
NSString *const applicationEntityName = @"Application";

@interface Application ()
@end


@implementation Application

#pragma mark - Inserts
- (void)awakeFromInsert
{
    [super awakeFromInsert];
    self.applicationDate = [NSDate date];
    self.applicationDescription = @"New Permit";
    self.appealed = [NSNumber numberWithBool:NO];
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
    NSDictionary *database;
    NSError *error;
    database = [NSJSONSerialization JSONObjectWithData:data
                                               options:kNilOptions
                                                 error:&error];
    if (!database) {
        NSLog(@"Error parsing data: %@", error.localizedDescription);
        return NO;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat =  @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'";
    dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    
    NSNumberFormatter *decimalFormat = [[NSNumberFormatter alloc] init];
    decimalFormat.numberStyle = NSNumberFormatterDecimalStyle;
    
//    [Application exploreDatabase:database];
    
    int count = 0;
    for (NSArray *row in database[@"data"]) {
        NSString *permitNumber = nil;
        NSString *address = nil;
        NSString *applicantName = nil;

        if (row[8] != [NSNull null]) {
            permitNumber = row[8];
        }
        Application *application = [Application findOrCreateApplicationWithPermitNumber:permitNumber context:context];
        if (application) {
            if (row[9] != [NSNull null]) {
                application.permitType = row[9];
            }
            if (row[11] != [NSNull null]) {
                application.applicationDescription = row[11];
            }
            if (row[12] != [NSNull null]) {
                application.category = row[12];
            }
            if (row[13] != [NSNull null]) {
                application.decisionType = row[13];
            }
            if (row[14] != [NSNull null]) {
                BOOL reviewIncluded = [row[14] boolValue];
                application.designReviewIncluded = [NSNumber numberWithBool:reviewIncluded];
            }
            if (row[15] != [NSNull null]) {
                application.value = [decimalFormat numberFromString:row[15]];
            }
            if (row[17] != [NSNull null]) {
                application.applicationDate = [dateFormatter dateFromString:row[17]];
            }
            if (row[18] != [NSNull null]) {
                application.decisionDate = [dateFormatter dateFromString:row[18]];
            }
            if (row[19] != [NSNull null]) {
                BOOL appealed = [row[19] boolValue];
                application.appealed = [NSNumber numberWithBool:appealed];
            }
            if (row[20] != [NSNull null]) {
                application.issueDate = [dateFormatter dateFromString:row[20]];
            }
            if (row[21] != [NSNull null]) {
                application.status = row[21];
            }
            if (row[22] != [NSNull null]) {
                application.contractor = row[22];
            }
            if (row[23] != [NSNull null]) {
                application.statusURL = row[23][0];
            }
        }
        
        if (row[10] != [NSNull null]) {
            address = row[10];
            
            Property *property = [Property findOrCreatePropertyWithAddress:address context:context];
            application.property = property;
            
            if (row[24] != [NSNull null]) {
                application.property.latitude = [decimalFormat numberFromString:row[24]];
            }
            if (row[25] != [NSNull null]) {
                application.property.longitude = [decimalFormat numberFromString:row[25]];
            }
        }
        
        if (row[16] != [NSNull null]) {
            applicantName = row[16];
            
            Applicant *applicant = [Applicant findOrCreateApplicantWithName:applicantName context:context];
            application.applicant = applicant;
        }
        
        count++;
        if (count > 100) {
            NSError *saveError;
            if (![context save:&saveError]) {
                NSLog(@"Error while saving: %@", saveError.localizedDescription);
                return NO;
            }
            count = 0;
        }
    }
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
