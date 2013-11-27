//
//  Property+FindAndCreate.m
//  Land Use Permits
//
//  Created by Jared Sorge on 11/22/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import "Property+FindAndCreate.h"

NSString *const fetchPropertyByAddress = @"FetchPropertyByAddress";
NSString *const fetchPropertyByAddressToken = @"ADDRESS";
NSString *const propertyEntityName = @"Property";

@implementation Property (FindAndCreate)

#pragma mark - Insert
- (void)awakeFromInsert
{
    self.address = @"742 Evergreen Terrace";
    self.latitude = @47.569099;
    self.longitude = @-122.230561;
}

#pragma mark - Public API
+ (Property *)findOrCreatePropertyWithAddress:(NSString *)address context:(NSManagedObjectContext *)context
{
    NSArray *properties = [self findPropertiesWithAddress:address context:context];
    Property *property = [properties lastObject];
    
    //If fetch fails then create the object
    if (!property) {
        property = [NSEntityDescription insertNewObjectForEntityForName:propertyEntityName inManagedObjectContext:context];
        property.address = address;
    }
    return property;
}

+ (NSArray *)findPropertiesWithAddress:(NSString *)address context:(NSManagedObjectContext *)context
{
    NSError *error;
    NSManagedObjectModel *model = context.persistentStoreCoordinator.managedObjectModel;
    
    NSFetchRequest *fetch = [model fetchRequestFromTemplateWithName:fetchPropertyByAddress substitutionVariables:@{fetchPropertyByAddressToken: address}];
    NSArray *fetchResult = [context executeFetchRequest:fetch error:&error];
    
    return fetchResult;
}

@end
