// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Applicant.m instead.

#import "_Applicant.h"

const struct ApplicantAttributes ApplicantAttributes = {
	.name = @"name",
};

const struct ApplicantRelationships ApplicantRelationships = {
	.applications = @"applications",
};

const struct ApplicantFetchedProperties ApplicantFetchedProperties = {
};

@implementation ApplicantID
@end

@implementation _Applicant

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Applicant" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Applicant";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Applicant" inManagedObjectContext:moc_];
}

- (ApplicantID*)objectID {
	return (ApplicantID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic applications;

	
- (NSMutableSet*)applicationsSet {
	[self willAccessValueForKey:@"applications"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"applications"];
  
	[self didAccessValueForKey:@"applications"];
	return result;
}
	






+ (NSArray*)fetchFetchApplicantByName:(NSManagedObjectContext*)moc_ NAME:(NSString*)NAME_ {
	NSError *error = nil;
	NSArray *result = [self fetchFetchApplicantByName:moc_ NAME:NAME_ error:&error];
	if (error) {
#ifdef NSAppKitVersionNumber10_0
		[NSApp presentError:error];
#else
		NSLog(@"error: %@", error);
#endif
	}
	return result;
}
+ (NSArray*)fetchFetchApplicantByName:(NSManagedObjectContext*)moc_ NAME:(NSString*)NAME_ error:(NSError**)error_ {
	NSParameterAssert(moc_);
	NSError *error = nil;

	NSManagedObjectModel *model = [[moc_ persistentStoreCoordinator] managedObjectModel];
	
	NSDictionary *substitutionVariables = [NSDictionary dictionaryWithObjectsAndKeys:
														
														NAME_, @"NAME",
														
														nil];
	
	NSFetchRequest *fetchRequest = [model fetchRequestFromTemplateWithName:@"FetchApplicantByName"
													 substitutionVariables:substitutionVariables];
	NSAssert(fetchRequest, @"Can't find fetch request named \"FetchApplicantByName\".");

	NSArray *result = [moc_ executeFetchRequest:fetchRequest error:&error];
	if (error_) *error_ = error;
	return result;
}



@end
