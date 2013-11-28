#import "Application.h"

NSString *const fetchApplicationByPermitNumber = @"FetchApplicationByPermitNumber";
NSString *const applicationPermitToken = @"PERMIT_NUMBER";
NSString *const applicationEntityName = @"Application";

@interface Application ()

// Private interface goes here.

@end


@implementation Application

#pragma mark - Inserts
- (void)awakeFromInsert
{
    self.applicationDate = [NSDate date];
    self.applicationDescription = @"A new permit";
    self.appealed = @0;
    self.category = @"Building";
    self.decisionType = @"Approval";
}

#pragma mark - API
+ (Application *)findOrCreateApplicationWithPermitNumber:(NSString *)permitNumber context:(NSManagedObjectContext *)context
{
    NSArray *applications = [self applicationsWithPermitNumber:permitNumber context:context];
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

@end
