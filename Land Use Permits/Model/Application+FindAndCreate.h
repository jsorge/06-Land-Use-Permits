//
//  Application+FindAndCreate.h
//  Land Use Permits
//
//  Created by Jared Sorge on 11/22/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import "Application.h"

@interface Application (FindAndCreate)

+ (Application *)findOrCreateApplicationWithName:(NSString *)name context:(NSManagedObjectContext *)context;
+ (NSArray *)applicationsWithPermitNumber:(NSString *)permitNumber context:(NSManagedObjectContext *)context;

@end
