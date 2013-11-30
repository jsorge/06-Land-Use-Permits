//
//  JMSDocument.m
//  Land Use Permits
//
//  Created by Jared Sorge on 11/22/13.
//  Copyright (c) 2013 jsorge. All rights reserved.
//

#import "JMSDocument.h"
#import "Application.h"
#import "Applicant.h"
#import "Property.h"
#import "JMSLandUsePermitLoader.h"

@interface JMSDocument ()
@property (weak) IBOutlet NSToolbarItem *dummyDataButton;
@property (weak) IBOutlet NSToolbarItem *fetchRemoteButton;
@end

@implementation JMSDocument

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"JMSDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    
    NSPersistentStoreCoordinator *psc = self.managedObjectContext.persistentStoreCoordinator;
    NSManagedObjectContext *newMoc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    newMoc.persistentStoreCoordinator = psc;
    self.managedObjectContext = newMoc;
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

#pragma mark - IBActions
- (IBAction)insertFakeData:(id)sender
{
    [self.dummyDataButton setEnabled:NO];
    
    Applicant *larry = [Applicant findOrCreateApplicantWithName:@"Larry" context:self.managedObjectContext];
    Applicant *curly = [Applicant findOrCreateApplicantWithName:@"Curly" context:self.managedObjectContext];
    Applicant *moe = [Applicant findOrCreateApplicantWithName:@"Moe" context:self.managedObjectContext];
    
    Property *house = [Property findOrCreatePropertyWithAddress:@"123 1st St." context:self.managedObjectContext];
    Property *shed = [Property findOrCreatePropertyWithAddress:@"123 2nd St." context:self.managedObjectContext];
    Property *boatLaunch = [Property findOrCreatePropertyWithAddress:@"125 1st St." context:self.managedObjectContext];
    
    Application *first = [Application findOrCreateApplicationWithPermitNumber:@"10001" context:self.managedObjectContext];
    first.applicant = larry;
    first.property = house;
    
    Application *second = [Application findOrCreateApplicationWithPermitNumber:@"10002" context:self.managedObjectContext];
    second.applicant = curly;
    second.property = shed;
    
    Application *third = [Application findOrCreateApplicationWithPermitNumber:@"10003" context:self.managedObjectContext];
    third.applicant = moe;
    third.property = boatLaunch;
    
    [self.dummyDataButton setEnabled:YES];
}

- (IBAction)fetchRemoteData:(id)sender
{
    [self.fetchRemoteButton setEnabled:NO];
    JMSLandUsePermitLoader *permitLoader = [[JMSLandUsePermitLoader alloc] init];
    [permitLoader downloadAndParseData:self.managedObjectContext];
}

@end
