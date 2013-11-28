#import "Applicant.h"

NSString *const fetchApplicantByName = @"FetchApplicantByName";
NSString *const applicantNameToken = @"NAME";
NSString *const applicantEntityName = @"Applicant";

@interface Applicant ()
// Private interface goes here.
@end


@implementation Applicant
#pragma mark - Insert
- (void)awakeFromInsert
{
    self.name = @"Homer";
}

#pragma mark - API
+ (Applicant *)findOrCreateApplicantWithName:(NSString *)name context:(NSManagedObjectContext *)context
{
    NSArray *applicants = [self findApplicantsWithName:name context:context];
    Applicant *applicant = [applicants lastObject];
    
    if (!applicant) {
        applicant = [NSEntityDescription insertNewObjectForEntityForName:applicantEntityName inManagedObjectContext:context];
        applicant.name = name;
    }
    
    return applicant;
}

+ (NSArray *)findApplicantsWithName:(NSString *)name context:(NSManagedObjectContext *)context
{
    NSError *error;
    NSManagedObjectModel *model = context.persistentStoreCoordinator.managedObjectModel;
    
    NSFetchRequest *fetch = [model fetchRequestFromTemplateWithName:fetchApplicantByName
                                              substitutionVariables:@{applicantNameToken: name}];
    NSArray *fetchResult = [context executeFetchRequest:fetch error:&error];
    
    return fetchResult;
}

@end
