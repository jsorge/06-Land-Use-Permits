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
- (void)permitLoader:(JMSLandUsePermitLoader *)loader didFinishWithSuccess:(BOOL)success;
@end

@interface JMSLandUsePermitLoader : NSObject <NSURLSessionDelegate>
#pragma mark - Properties
@property (nonatomic, unsafe_unretained)id<JMSLandUsePermitLoaderDelegate>delegate;

#pragma mark - API
/**
 *  Downloads the JSON data from Seattle and initiates parsing and populating of Core Data
 *
 *  @param context Main Thread's Managed Object Context
 *
 *  @return Success or Failure
 */
- (BOOL)downloadAndParseData:(NSManagedObjectContext *)context;
@end
