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
- (void)downloadAndParseData:(NSManagedObjectContext *)mainContext
{
    __block BOOL success = YES;
    
    NSManagedObjectContext *workerContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    workerContext.parentContext = mainContext;
    
    NSURLSession *downloadSession = [NSURLSession sharedSession];
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
                                                         }
                                                     }];
    [downloadTask resume];
}
@end
