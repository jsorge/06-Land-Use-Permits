//
//  JMSLandUsePermitLoader.m
//  Land Use Permits
//
//  Created by Jared Sorge on 11/28/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import "JMSLandUsePermitLoader.h"
#import "Application.h"

@implementation JMSLandUsePermitLoader
#pragma mark - API
- (BOOL)downloadAndParseData:(NSManagedObjectContext *)context
{
    __block BOOL success = YES;
    
    NSManagedObjectContext *childContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    childContext.parentContext = context;
    
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *downloadSession = [NSURLSession sessionWithConfiguration:sessionConfig];
    NSURL *downloadURL = [NSURL URLWithString:[Application jsonDownloadURL]];
    NSURLSessionTask *downloadTask =  [downloadSession dataTaskWithURL:downloadURL
                                                     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                                         if (!error) {
                                                             success = [Application repopulateWithData:data inContext:childContext];
                                                         } else {
                                                             NSLog(@"Data download failed with error: %@", error.localizedDescription);
                                                             success = NO;
                                                         }
                                                         
                                                     }];
    [downloadTask resume];
    
    return success;
}
@end
