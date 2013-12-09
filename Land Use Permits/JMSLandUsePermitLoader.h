//
//  JMSLandUsePermitLoader.h
//  Land Use Permits
//
//  Created by Jared Sorge on 11/28/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JMSLandUsePermitLoader;

@protocol JMSLandUsePermitLoaderDelegate <NSObject>
/**
 *  Called after the PermitLoader finished downlaoding and parsing
 *
 *  @param loader  The JMSLandUsePermitLoader object
 *  @param success BOOL value of the success/failure of the downloading and parsing
 */
- (void)permitLoader:(JMSLandUsePermitLoader *)loader didFinishWithSuccess:(BOOL)success;
@end

@interface JMSLandUsePermitLoader : NSObject <NSURLSessionDelegate>
@property (nonatomic, unsafe_unretained)id<JMSLandUsePermitLoaderDelegate>delegate;

#pragma mark - API
/**
 *  Downloads the JSON data from Seattle and initiates parsing and populating of Core Data
 *
 *  @param context Main Thread's Managed Object Context
 */
- (void)downloadAndParseData:(NSManagedObjectContext *)context;
@end
