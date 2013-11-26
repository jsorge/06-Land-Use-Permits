//
//  Application+FindAndCreate.m
//  Land Use Permits
//
//  Created by Jared Sorge on 11/22/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import "Application+FindAndCreate.h"
#import "Property+FindAndCreate.h"

NSString *const fetchApplicationByPermitNumber = @"FetchApplicationByPermitNumber";
NSString *const applicationPermitToken = @"PERMIT_NUMBER";
NSString *const applicationEntityName = @"Application";

@implementation Application (FindAndCreate)

#pragma mark - API


+ (Application *)findOrCreateApplicationWithPermitNumber:(NSString *)permitNumber context:(NSManagedObjectContext *)context
{
    NSArray *applications = [self applicationsWithPermitNumber:permitNumber context:context];
    Application *application = [applications lastObject];
    
    if (!application) {
        application = [NSEntityDescription insertNewObjectForEntityForName:applicationEntityName inManagedObjectContext:context];
        application.applicationPermitNumber = permitNumber;
    }
    return application;
}

+ (NSArray *)applicationsWithPermitNumber:(NSString *)permitNumber context:(NSManagedObjectContext *)context
{
    NSError *error;
    NSManagedObjectModel *model = context.persistentStoreCoordinator.managedObjectModel;
    
    NSFetchRequest *fetch = [model fetchRequestFromTemplateWithName:fetchApplicationByPermitNumber substitutionVariables:@{applicationPermitToken: permitNumber}];
    NSArray *fetchResult = [context executeFetchRequest:fetch error:&error];
    
    return fetchResult;
}

@end
