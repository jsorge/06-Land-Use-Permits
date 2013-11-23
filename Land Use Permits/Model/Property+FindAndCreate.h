//
//  Property+FindAndCreate.h
//  Land Use Permits
//
//  Created by Jared Sorge on 11/22/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import "Property.h"

@interface Property (FindAndCreate)

extern NSString *dataModelName;
extern NSString *dataModelExtension;

+ (Property *)findOrCreatePropertyWithAddress:(NSString *)address context:(NSManagedObjectContext *)context;
+ (NSArray *)findPropertiesWithAddress:(NSString *)address context:(NSManagedObjectContext *)context;

@end
