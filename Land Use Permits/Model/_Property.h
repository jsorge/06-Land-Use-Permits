// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Property.h instead.

#import <CoreData/CoreData.h>


extern const struct PropertyAttributes {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
} PropertyAttributes;

extern const struct PropertyRelationships {
	__unsafe_unretained NSString *applications;
} PropertyRelationships;

extern const struct PropertyFetchedProperties {
} PropertyFetchedProperties;

@class Application;





@interface PropertyID : NSManagedObjectID {}
@end

@interface _Property : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PropertyID*)objectID;





@property (nonatomic, strong) NSString* address;



//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;





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





@property (nonatomic, strong) NSSet *applications;

- (NSMutableSet*)applicationsSet;




+ (NSArray*)fetchFetchPropertyByAddress:(NSManagedObjectContext*)moc_ ADDRESS:(NSString*)ADDRESS_ ;
+ (NSArray*)fetchFetchPropertyByAddress:(NSManagedObjectContext*)moc_ ADDRESS:(NSString*)ADDRESS_ error:(NSError**)error_;




@end

@interface _Property (CoreDataGeneratedAccessors)

- (void)addApplications:(NSSet*)value_;
- (void)removeApplications:(NSSet*)value_;
- (void)addApplicationsObject:(Application*)value_;
- (void)removeApplicationsObject:(Application*)value_;

@end

@interface _Property (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;




- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;




- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;





- (NSMutableSet*)primitiveApplications;
- (void)setPrimitiveApplications:(NSMutableSet*)value;


@end
