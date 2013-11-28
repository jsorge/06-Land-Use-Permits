//
//  Applicant.h
//  Land Use Permits
//
//  Created by Jared Sorge on 11/23/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Application;

@interface Applicant : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *applications;
@end

@interface Applicant (CoreDataGeneratedAccessors)

- (void)addApplicationsObject:(Application *)value;
- (void)removeApplicationsObject:(Application *)value;
- (void)addApplications:(NSSet *)values;
- (void)removeApplications:(NSSet *)values;

@end
