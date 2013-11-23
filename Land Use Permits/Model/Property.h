//
//  Property.h
//  Land Use Permits
//
//  Created by Jared Sorge on 11/22/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Property : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSSet *applications;
@end

@interface Property (CoreDataGeneratedAccessors)

- (void)addApplicationsObject:(NSManagedObject *)value;
- (void)removeApplicationsObject:(NSManagedObject *)value;
- (void)addApplications:(NSSet *)values;
- (void)removeApplications:(NSSet *)values;

+ (Property *)findOrCreatePropertyWithAddress:(NSString *)address context:(NSManagedObjectContext *)context;
+ (NSArray *)findPropertiesWithAddress:(NSString *)address context:(NSManagedObjectContext *)context;

@end
