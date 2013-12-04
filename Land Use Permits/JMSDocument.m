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

@interface JMSDocument () <JMSLandUsePermitLoaderDelegate>
@property (weak) IBOutlet NSToolbarItem *dummyDataButton;
@property (weak) IBOutlet NSToolbarItem *fetchRemoteButton;
@property (weak) IBOutlet NSTextField *downloadingDataLabel;
@property (weak) IBOutlet NSProgressIndicator *progressBar;
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
    return @"JMSDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    
    NSPersistentStoreCoordinator *psc = self.managedObjectContext.persistentStoreCoordinator;
    
    NSManagedObjectContext *masterContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    masterContext.persistentStoreCoordinator = psc;
    
    NSManagedObjectContext *mainContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
//    mainContext.persistentStoreCoordinator = psc;
    mainContext.parentContext = masterContext;
    self.managedObjectContext = mainContext;
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
    
    [self.downloadingDataLabel setHidden:NO];
    [self.progressBar setHidden:NO];
    [self.progressBar startAnimation:self];
    
    JMSLandUsePermitLoader *permitLoader = [[JMSLandUsePermitLoader alloc] init];
    permitLoader.delegate = self;
    [permitLoader downloadAndParseData:self.managedObjectContext];
}

#pragma mark - JMSLandUsePermitLoaderDelegate
- (void)permitLoader:(JMSLandUsePermitLoader *)loader didFinishWithSuccess:(BOOL)success
{
    [self.fetchRemoteButton setEnabled:YES];
    
    [self.downloadingDataLabel setHidden:YES];
    [self.progressBar setHidden:YES];
    [self.progressBar stopAnimation:self];
}

#pragma mark - Toolbar Vaildation
- (BOOL)validateToolbarItem:(NSToolbarItem *)theItem
{
    return [theItem isEnabled];
}

@end
