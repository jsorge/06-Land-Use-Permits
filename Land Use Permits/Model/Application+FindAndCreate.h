//
//  Application+FindAndCreate.h
//  Land Use Permits
//
//  Created by Jared Sorge on 11/22/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import "Application.h"

@interface Application (FindAndCreate)

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

@end
