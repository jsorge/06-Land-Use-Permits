#import "_Application.h"

@interface Application : _Application {}

#pragma mark - API
/**
 *  Searches for an application by permit number. If one is present it is returned otherwise it is created
 *
 *  @param permitNumber Permit number
 *  @param context      Managed Object Context
 *
 *  @return Application
 */
+ (Application *)findOrCreateApplicationWithPermitNumber:(NSString *)permitNumber context:(NSManagedObjectContext *)context;

/**
 *  Fetches all applications with a given permit number
 *
 *  @param permitNumber Permit Number
 *  @param context      Managed Object Context
 *
 *  @return Array of applications
 */
+ (NSArray *)applicationsWithPermitNumber:(NSString *)permitNumber context:(NSManagedObjectContext *)context;

/**
 *
 *
 *  @return The URL string to download the JSON that will populate the data model
 */
+ (NSString *)jsonDownloadURL;

/**
 *  Parses out the contents of the data downloaded from the jsonDownloadURL and creates the objects
 *
 *  @param data    NSData containing JSON
 *  @param context NSManagedObjectContext - Preferrably configured with NSPrivateQueueConcurrencyType
 *
 *  @return YES/NO
 */
+ (BOOL)repopulateWithData:(NSData *)data inContext:(NSManagedObjectContext *)context;

@end
