//
//  Applicant+FindAndCreate.h
//  Land Use Permits
//
//  Created by Jared Sorge on 11/22/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import "Applicant.h"

@interface Applicant (FindAndCreate)

+ (Applicant *)findOrCreateApplicantWithName:(NSString *)name context:(NSManagedObjectContext *)context;
+ (NSArray *)findApplicantsWithName:(NSString *)name context:(NSManagedObjectContext *)context;

@end
