//
//  Applicant+FindAndCreate.h
//  Land Use Permits
//
//  Created by Jared Sorge on 11/22/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import "Applicant.h"

@interface Applicant (FindAndCreate)

/**
 *  Returns the applicant based on the name search
 *
 *  @param name    Applicant's name
 *  @param context Managed Object Context
 *
 *  @return Applicant
 */
+ (Applicant *)findOrCreateApplicantWithName:(NSString *)name context:(NSManagedObjectContext *)context;

/**
 *  Finds all applicants with a given name
 *
 *  @param name    Applicant's name
 *  @param context Managed Object Context
 *
 *  @return An array of applicants
 */
+ (NSArray *)findApplicantsWithName:(NSString *)name context:(NSManagedObjectContext *)context;

@end
