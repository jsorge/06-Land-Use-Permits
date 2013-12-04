//
//  JMSLandUsePermitLoader.m
//  Land Use Permits
//
//  Created by Jared Sorge on 11/28/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import "JMSLandUsePermitLoader.h"
#import "Application.h"

@interface JMSLandUsePermitLoader ()
@end

@implementation JMSLandUsePermitLoader
#pragma mark - API
- (BOOL)downloadAndParseData:(NSManagedObjectContext *)mainContext
{
    __block BOOL success = YES;
    
    NSManagedObjectContext *workerContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    workerContext.parentContext = mainContext;
    
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *downloadSession = [NSURLSession sessionWithConfiguration:sessionConfig];
    NSURL *downloadURL = [NSURL URLWithString:[Application jsonDownloadURL]];
    NSURLSessionTask *downloadTask =  [downloadSession dataTaskWithURL:downloadURL
                                                     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                                         if (!error) {
                                                             [workerContext performBlock:^{
                                                                 success = [Application repopulateWithData:data inContext:workerContext];
                                                                 [self.delegate permitLoader:self
                                                                        didFinishWithSuccess:success];
                                                             }];
                                                         } else {
                                                             NSLog(@"Data download failed with error: %@", error.localizedDescription);
                                                             success = NO;
                                                         }
                                                     }];
    [downloadTask resume];
    
    return success;
}
@end
