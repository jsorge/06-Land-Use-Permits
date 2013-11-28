// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Application.m instead.

#import "_Application.h"

const struct ApplicationAttributes ApplicationAttributes = {
	.appealed = @"appealed",
	.applicationDate = @"applicationDate",
	.applicationDescription = @"applicationDescription",
	.applicationPermitNumber = @"applicationPermitNumber",
	.category = @"category",
	.contractor = @"contractor",
	.decisionDate = @"decisionDate",
	.decisionType = @"decisionType",
	.designReviewIncluded = @"designReviewIncluded",
	.latitude = @"latitude",
	.longitude = @"longitude",
	.permitType = @"permitType",
	.status = @"status",
	.statusURL = @"statusURL",
	.value = @"value",
};

const struct ApplicationRelationships ApplicationRelationships = {
	.applicant = @"applicant",
	.property = @"property",
};

const struct ApplicationFetchedProperties ApplicationFetchedProperties = {
};

@implementation ApplicationID
@end

@implementation _Application

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Application" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Application";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Application" inManagedObjectContext:moc_];
}

- (ApplicationID*)objectID {
	return (ApplicationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"appealedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"appealed"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"contractorValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"contractor"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"designReviewIncludedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"designReviewIncluded"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
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
	if ([key isEqualToString:@"valueValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"value"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic appealed;



- (BOOL)appealedValue {
	NSNumber *result = [self appealed];
	return [result boolValue];
}

- (void)setAppealedValue:(BOOL)value_ {
	[self setAppealed:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveAppealedValue {
	NSNumber *result = [self primitiveAppealed];
	return [result boolValue];
}

- (void)setPrimitiveAppealedValue:(BOOL)value_ {
	[self setPrimitiveAppealed:[NSNumber numberWithBool:value_]];
}





@dynamic applicationDate;






@dynamic applicationDescription;






@dynamic applicationPermitNumber;






@dynamic category;






@dynamic contractor;



- (double)contractorValue {
	NSNumber *result = [self contractor];
	return [result doubleValue];
}

- (void)setContractorValue:(double)value_ {
	[self setContractor:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveContractorValue {
	NSNumber *result = [self primitiveContractor];
	return [result doubleValue];
}

- (void)setPrimitiveContractorValue:(double)value_ {
	[self setPrimitiveContractor:[NSNumber numberWithDouble:value_]];
}





@dynamic decisionDate;






@dynamic decisionType;






@dynamic designReviewIncluded;



- (BOOL)designReviewIncludedValue {
	NSNumber *result = [self designReviewIncluded];
	return [result boolValue];
}

- (void)setDesignReviewIncludedValue:(BOOL)value_ {
	[self setDesignReviewIncluded:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveDesignReviewIncludedValue {
	NSNumber *result = [self primitiveDesignReviewIncluded];
	return [result boolValue];
}

- (void)setPrimitiveDesignReviewIncludedValue:(BOOL)value_ {
	[self setPrimitiveDesignReviewIncluded:[NSNumber numberWithBool:value_]];
}





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





@dynamic permitType;






@dynamic status;






@dynamic statusURL;






@dynamic value;



- (double)valueValue {
	NSNumber *result = [self value];
	return [result doubleValue];
}

- (void)setValueValue:(double)value_ {
	[self setValue:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveValueValue {
	NSNumber *result = [self primitiveValue];
	return [result doubleValue];
}

- (void)setPrimitiveValueValue:(double)value_ {
	[self setPrimitiveValue:[NSNumber numberWithDouble:value_]];
}





@dynamic applicant;

	

@dynamic property;

	






+ (NSArray*)fetchFetchApplicationByPermitNumber:(NSManagedObjectContext*)moc_ PERMIT_NUMBER:(NSString*)PERMIT_NUMBER_ {
	NSError *error = nil;
	NSArray *result = [self fetchFetchApplicationByPermitNumber:moc_ PERMIT_NUMBER:PERMIT_NUMBER_ error:&error];
	if (error) {
#ifdef NSAppKitVersionNumber10_0
		[NSApp presentError:error];
#else
		NSLog(@"error: %@", error);
#endif
	}
	return result;
}
+ (NSArray*)fetchFetchApplicationByPermitNumber:(NSManagedObjectContext*)moc_ PERMIT_NUMBER:(NSString*)PERMIT_NUMBER_ error:(NSError**)error_ {
	NSParameterAssert(moc_);
	NSError *error = nil;

	NSManagedObjectModel *model = [[moc_ persistentStoreCoordinator] managedObjectModel];
	
	NSDictionary *substitutionVariables = [NSDictionary dictionaryWithObjectsAndKeys:
														
														PERMIT_NUMBER_, @"PERMIT_NUMBER",
														
														nil];
	
	NSFetchRequest *fetchRequest = [model fetchRequestFromTemplateWithName:@"FetchApplicationByPermitNumber"
													 substitutionVariables:substitutionVariables];
	NSAssert(fetchRequest, @"Can't find fetch request named \"FetchApplicationByPermitNumber\".");

	NSArray *result = [moc_ executeFetchRequest:fetchRequest error:&error];
	if (error_) *error_ = error;
	return result;
}



@end
