//
//  JMSDocument.h
//  Land Use Permits
//
//  Created by Jared Sorge on 11/22/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface JMSDocument : NSPersistentDocument

#pragma mark - IBActions
/**
 *  Creates the fake data to populate the table.
 *
 *  @param sender Not used
 */
- (IBAction)insertFakeData:(id)sender;

/**
 *  Fetches the data and populates the core data stack
 *
 *  @param sender Not used
 */
- (IBAction)fetchRemoteData:(id)sender;


@end
