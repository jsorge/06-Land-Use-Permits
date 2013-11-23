//
//  Application.h
//  Land Use Permits
//
//  Created by Jared Sorge on 11/22/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Applicant, Property;

@interface Application : NSManagedObject

@property (nonatomic, retain) NSDate * applicationDate;
@property (nonatomic, retain) NSString * applicationPermitNumber;
@property (nonatomic, retain) NSString * permitType;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * applicationDescription;
@property (nonatomic, retain) NSNumber * category;
@property (nonatomic, retain) NSString * decisionType;
@property (nonatomic, retain) NSNumber * designReviewIncluded;
@property (nonatomic, retain) NSNumber * value;
@property (nonatomic, retain) NSString * applicantName;
@property (nonatomic, retain) NSDate * decisionDate;
@property (nonatomic, retain) NSNumber * appealed;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSNumber * contractor;
@property (nonatomic, retain) NSString * statusURL;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) Property *properties;
@property (nonatomic, retain) Applicant *applicants;

@end
