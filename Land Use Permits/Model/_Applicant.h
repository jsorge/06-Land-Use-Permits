// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Applicant.h instead.

#import <CoreData/CoreData.h>


extern const struct ApplicantAttributes {
	__unsafe_unretained NSString *name;
} ApplicantAttributes;

extern const struct ApplicantRelationships {
	__unsafe_unretained NSString *applications;
} ApplicantRelationships;

extern const struct ApplicantFetchedProperties {
} ApplicantFetchedProperties;

@class Application;



@interface ApplicantID : NSManagedObjectID {}
@end

@interface _Applicant : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ApplicantID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *applications;

- (NSMutableSet*)applicationsSet;




+ (NSArray*)fetchFetchApplicantByName:(NSManagedObjectContext*)moc_ NAME:(NSString*)NAME_ ;
+ (NSArray*)fetchFetchApplicantByName:(NSManagedObjectContext*)moc_ NAME:(NSString*)NAME_ error:(NSError**)error_;




@end

@interface _Applicant (CoreDataGeneratedAccessors)

- (void)addApplications:(NSSet*)value_;
- (void)removeApplications:(NSSet*)value_;
- (void)addApplicationsObject:(Application*)value_;
- (void)removeApplicationsObject:(Application*)value_;

@end

@interface _Applicant (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveApplications;
- (void)setPrimitiveApplications:(NSMutableSet*)value;


@end
