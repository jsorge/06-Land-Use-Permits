// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Application.h instead.

#import <CoreData/CoreData.h>


extern const struct ApplicationAttributes {
	__unsafe_unretained NSString *appealed;
	__unsafe_unretained NSString *applicationDate;
	__unsafe_unretained NSString *applicationDescription;
	__unsafe_unretained NSString *applicationPermitNumber;
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *contractor;
	__unsafe_unretained NSString *decisionDate;
	__unsafe_unretained NSString *decisionType;
	__unsafe_unretained NSString *designReviewIncluded;
	__unsafe_unretained NSString *issueDate;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
	__unsafe_unretained NSString *permitType;
	__unsafe_unretained NSString *status;
	__unsafe_unretained NSString *statusURL;
	__unsafe_unretained NSString *value;
} ApplicationAttributes;

extern const struct ApplicationRelationships {
	__unsafe_unretained NSString *applicant;
	__unsafe_unretained NSString *property;
} ApplicationRelationships;

extern const struct ApplicationFetchedProperties {
} ApplicationFetchedProperties;

@class Applicant;
@class Property;


















@interface ApplicationID : NSManagedObjectID {}
@end

@interface _Application : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ApplicationID*)objectID;





@property (nonatomic, strong) NSNumber* appealed;



@property BOOL appealedValue;
- (BOOL)appealedValue;
- (void)setAppealedValue:(BOOL)value_;

//- (BOOL)validateAppealed:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* applicationDate;



//- (BOOL)validateApplicationDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* applicationDescription;



//- (BOOL)validateApplicationDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* applicationPermitNumber;



//- (BOOL)validateApplicationPermitNumber:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* category;



//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* contractor;



//- (BOOL)validateContractor:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* decisionDate;



//- (BOOL)validateDecisionDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* decisionType;



//- (BOOL)validateDecisionType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* designReviewIncluded;



@property BOOL designReviewIncludedValue;
- (BOOL)designReviewIncludedValue;
- (void)setDesignReviewIncludedValue:(BOOL)value_;

//- (BOOL)validateDesignReviewIncluded:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* issueDate;



//- (BOOL)validateIssueDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* latitude;



@property double latitudeValue;
- (double)latitudeValue;
- (void)setLatitudeValue:(double)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* longitude;



@property double longitudeValue;
- (double)longitudeValue;
- (void)setLongitudeValue:(double)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* permitType;



//- (BOOL)validatePermitType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* status;



//- (BOOL)validateStatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* statusURL;



//- (BOOL)validateStatusURL:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* value;



@property double valueValue;
- (double)valueValue;
- (void)setValueValue:(double)value_;

//- (BOOL)validateValue:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Applicant *applicant;

//- (BOOL)validateApplicant:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Property *property;

//- (BOOL)validateProperty:(id*)value_ error:(NSError**)error_;




+ (NSArray*)fetchFetchApplicationByPermitNumber:(NSManagedObjectContext*)moc_ PERMIT_NUMBER:(NSString*)PERMIT_NUMBER_ ;
+ (NSArray*)fetchFetchApplicationByPermitNumber:(NSManagedObjectContext*)moc_ PERMIT_NUMBER:(NSString*)PERMIT_NUMBER_ error:(NSError**)error_;




@end

@interface _Application (CoreDataGeneratedAccessors)

@end

@interface _Application (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveAppealed;
- (void)setPrimitiveAppealed:(NSNumber*)value;

- (BOOL)primitiveAppealedValue;
- (void)setPrimitiveAppealedValue:(BOOL)value_;




- (NSDate*)primitiveApplicationDate;
- (void)setPrimitiveApplicationDate:(NSDate*)value;




- (NSString*)primitiveApplicationDescription;
- (void)setPrimitiveApplicationDescription:(NSString*)value;




- (NSString*)primitiveApplicationPermitNumber;
- (void)setPrimitiveApplicationPermitNumber:(NSString*)value;




- (NSString*)primitiveCategory;
- (void)setPrimitiveCategory:(NSString*)value;




- (NSString*)primitiveContractor;
- (void)setPrimitiveContractor:(NSString*)value;




- (NSDate*)primitiveDecisionDate;
- (void)setPrimitiveDecisionDate:(NSDate*)value;




- (NSString*)primitiveDecisionType;
- (void)setPrimitiveDecisionType:(NSString*)value;




- (NSNumber*)primitiveDesignReviewIncluded;
- (void)setPrimitiveDesignReviewIncluded:(NSNumber*)value;

- (BOOL)primitiveDesignReviewIncludedValue;
- (void)setPrimitiveDesignReviewIncludedValue:(BOOL)value_;




- (NSDate*)primitiveIssueDate;
- (void)setPrimitiveIssueDate:(NSDate*)value;




- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;




- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;




- (NSString*)primitivePermitType;
- (void)setPrimitivePermitType:(NSString*)value;




- (NSString*)primitiveStatus;
- (void)setPrimitiveStatus:(NSString*)value;




- (NSString*)primitiveStatusURL;
- (void)setPrimitiveStatusURL:(NSString*)value;




- (NSNumber*)primitiveValue;
- (void)setPrimitiveValue:(NSNumber*)value;

- (double)primitiveValueValue;
- (void)setPrimitiveValueValue:(double)value_;





- (Applicant*)primitiveApplicant;
- (void)setPrimitiveApplicant:(Applicant*)value;



- (Property*)primitiveProperty;
- (void)setPrimitiveProperty:(Property*)value;


@end
