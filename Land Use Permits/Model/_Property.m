// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Property.m instead.

#import "_Property.h"

const struct PropertyAttributes PropertyAttributes = {
	.address = @"address",
	.latitude = @"latitude",
	.longitude = @"longitude",
};

const struct PropertyRelationships PropertyRelationships = {
	.applications = @"applications",
};

const struct PropertyFetchedProperties PropertyFetchedProperties = {
};

@implementation PropertyID
@end

@implementation _Property

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Property" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Property";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Property" inManagedObjectContext:moc_];
}

- (PropertyID*)objectID {
	return (PropertyID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"latitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"latitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic address;






@dynamic latitude;



- (double)latitudeValue {
	NSNumber *result = [self latitude];
	return [result doubleValue];
}

- (void)setLatitudeValue:(double)value_ {
	[self setLatitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLatitudeValue {
	NSNumber *result = [self primitiveLatitude];
	return [result doubleValue];
}

- (void)setPrimitiveLatitudeValue:(double)value_ {
	[self setPrimitiveLatitude:[NSNumber numberWithDouble:value_]];
}





@dynamic longitude;



- (double)longitudeValue {
	NSNumber *result = [self longitude];
	return [result doubleValue];
}

- (void)setLongitudeValue:(double)value_ {
	[self setLongitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveLongitudeValue {
	NSNumber *result = [self primitiveLongitude];
	return [result doubleValue];
}

- (void)setPrimitiveLongitudeValue:(double)value_ {
	[self setPrimitiveLongitude:[NSNumber numberWithDouble:value_]];
}





@dynamic applications;

	
- (NSMutableSet*)applicationsSet {
	[self willAccessValueForKey:@"applications"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"applications"];
  
	[self didAccessValueForKey:@"applications"];
	return result;
}
	






+ (NSArray*)fetchFetchPropertyByAddress:(NSManagedObjectContext*)moc_ ADDRESS:(NSString*)ADDRESS_ {
	NSError *error = nil;
	NSArray *result = [self fetchFetchPropertyByAddress:moc_ ADDRESS:ADDRESS_ error:&error];
	if (error) {
#ifdef NSAppKitVersionNumber10_0
		[NSApp presentError:error];
#else
		NSLog(@"error: %@", error);
#endif
	}
	return result;
}
+ (NSArray*)fetchFetchPropertyByAddress:(NSManagedObjectContext*)moc_ ADDRESS:(NSString*)ADDRESS_ error:(NSError**)error_ {
	NSParameterAssert(moc_);
	NSError *error = nil;

	NSManagedObjectModel *model = [[moc_ persistentStoreCoordinator] managedObjectModel];
	
	NSDictionary *substitutionVariables = [NSDictionary dictionaryWithObjectsAndKeys:
														
														ADDRESS_, @"ADDRESS",
														
														nil];
	
	NSFetchRequest *fetchRequest = [model fetchRequestFromTemplateWithName:@"FetchPropertyByAddress"
													 substitutionVariables:substitutionVariables];
	NSAssert(fetchRequest, @"Can't find fetch request named \"FetchPropertyByAddress\".");

	NSArray *result = [moc_ executeFetchRequest:fetchRequest error:&error];
	if (error_) *error_ = error;
	return result;
}



@end
