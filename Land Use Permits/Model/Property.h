#import "_Property.h"

@interface Property : _Property {}

/**
 *  Returns a property either created or fetched givn its address
 *
 *  @param address Property Address
 *  @param context Managed Object Context
 *
 *  @return Property
 */
+ (Property *)findOrCreatePropertyWithAddress:(NSString *)address context:(NSManagedObjectContext *)context;

/**
 *  Finds all properties by a given address
 *
 *  @param address Property Address
 *  @param context Managed Object Context
 *
 *  @return Array of Properties
 */
+ (NSArray *)findPropertiesWithAddress:(NSString *)address context:(NSManagedObjectContext *)context;


@end
