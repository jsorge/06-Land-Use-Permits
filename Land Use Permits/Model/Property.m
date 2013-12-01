#import "Property.h"

NSString *const fetchPropertyByAddress = @"FetchPropertyByAddress";
NSString *const fetchPropertyByAddressToken = @"ADDRESS";
NSString *const propertyEntityName = @"Property";

@interface Property ()
// Private interface goes here.
@end


@implementation Property
#pragma mark - Insert
- (void)awakeFromInsert
{
    [super awakeFromInsert];
    self.address = @"742 Evergreen Terrace";
    self.latitude = @47.569099;
    self.longitude = [NSNumber numberWithDouble:-122.230561];
}

#pragma mark - Public API
+ (Property *)findOrCreatePropertyWithAddress:(NSString *)address context:(NSManagedObjectContext *)context
{
    NSArray *properties = [Property findPropertiesWithAddress:address context:context];
    Property *property = [properties lastObject];
    
    //If fetch fails then create the object
    if (!property) {
        property = [NSEntityDescription insertNewObjectForEntityForName:propertyEntityName inManagedObjectContext:context];
        property.address = address;
    }
    return property;
}

+ (NSArray *)findPropertiesWithAddress:(NSString *)address context:(NSManagedObjectContext *)context
{
    NSError *error;
    NSManagedObjectModel *model = context.persistentStoreCoordinator.managedObjectModel;
    
    NSFetchRequest *fetch = [model fetchRequestFromTemplateWithName:fetchPropertyByAddress substitutionVariables:@{fetchPropertyByAddressToken: address}];
    NSArray *fetchResult = [context executeFetchRequest:fetch error:&error];
    
    return fetchResult;
}

@end
