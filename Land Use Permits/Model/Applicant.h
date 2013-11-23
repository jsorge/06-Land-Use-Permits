//
//  Applicant.h
//  Land Use Permits
//
//  Created by Jared Sorge on 11/22/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Applicant : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *application;
@end

@interface Applicant (CoreDataGeneratedAccessors)

- (void)addApplicationObject:(NSManagedObject *)value;
- (void)removeApplicationObject:(NSManagedObject *)value;
- (void)addApplication:(NSSet *)values;
- (void)removeApplication:(NSSet *)values;

+ (Applicant *)findOrCreateApplicantWithName:(NSString *)name context:(NSManagedObjectContext *)context;
+ (NSArray *)findApplicantsWithName:(NSString *)name context:(NSManagedObjectContext *)context;

@end
