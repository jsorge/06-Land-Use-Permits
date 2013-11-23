//
//  Property+FindAndCreate.m
//  Land Use Permits
//
//  Created by Jared Sorge on 11/22/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import "Property+FindAndCreate.h"

NSString *const fetchPropertyByAddress = @"FetchPropertyByAddress";
NSString *const fetchPropertyByAddressVariable = @"$address";
NSString *const propertyEntityName = @"Property";
NSString *dataModelName = @"JMSDocument";
NSString *dataModelExtension = @"momd";

@implementation Property (FindAndCreate)

#pragma mark - Public API

/**
 *  Returns a property either created or fetched givn its address
 *
 *  @param address Property Address
 *  @param context Managed Object Context
 *
 *  @return Property
 */
+ (Property *)findOrCreatePropertyWithAddress:(NSString *)address context:(NSManagedObjectContext *)context
{
    NSArray *properties = [self findPropertiesWithAddress:address context:context];
    Property *property = [properties lastObject];
    
    //If fetch fails then create the object
    if (!property) {
        property = [NSEntityDescription insertNewObjectForEntityForName:propertyEntityName inManagedObjectContext:context];
    }
    return property;
}

/**
 *  Finds all properties by a given address
 *
 *  @param address Property Address
 *  @param context Managed Object Context
 *
 *  @return Array of Properties
 */
+ (NSArray *)findPropertiesWithAddress:(NSString *)address context:(NSManagedObjectContext *)context
{
    NSError *error;
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:dataModelName withExtension:dataModelExtension];
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    NSFetchRequest *fetch = [model fetchRequestFromTemplateWithName:fetchPropertyByAddress substitutionVariables:@{fetchPropertyByAddressVariable: address}];
    NSArray *fetchResult = [context executeFetchRequest:fetch error:&error];
    
    return fetchResult;
}

@end
