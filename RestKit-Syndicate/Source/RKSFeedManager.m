//
//  RKSFeedManager.m
//  RestKit-Syndicate
//
//  Created by Denis Zamataev on 2/17/14.
//  Copyright (c) 2014 DZamataev. All rights reserved.
//

#import "RKSFeedManager.h"

#import "RKSFeed.h"
#import "RKSChannel.h"
#import "RKSItem.h"
#import "RKSImage.h"

@implementation RKSFeedManager
-(id)initWithUrl:(NSURL*)baseURL andStoreName:(NSString*)storeName
{
    NSAssert(baseURL && storeName, @"Bad arguments");
    
    self = [super init];
    if (self) {
        // Initialize RestKit
        self.objectManager = [RKObjectManager managerWithBaseURL:baseURL];
        
#if DEBUG
        // Log all HTTP traffic with request and response bodies
        RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
        
        // Log debugging info about Core Data
        RKLogConfigureByName("RestKit/CoreData", RKLogLevelDebug);
        
        // Log only critical messages from the Object Mapping component
        RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelDebug);
#endif
        
        // accept xml mime type and make parser add prefix _ before xml attributes
        [RKMIMETypeSerialization registerClass:[RKXMLDictionarySerialization class] forMIMEType:RKMIMETypeTextXML];
        [RKMIMETypeSerialization registerClass:[RKXMLDictionarySerialization class] forMIMEType:RKMIMETypeXML];
        [RKMIMETypeSerialization registerClass:[RKXMLDictionarySerialization class] forMIMEType:@"application/rss+xml"];
        [RKMIMETypeSerialization registerClass:[RKXMLDictionarySerialization class] forMIMEType:@"application/rss"];
        [RKXMLDictionarySerialization sharedParser].attributesMode = XMLDictionaryAttributesModePrefixed;
        // Enable Activity Indicator Spinner
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
        
        // Initialize managed object store
        NSURL *modelURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"RestKitSyndicate" ofType:@"momd"]]; // §The mom and momd files are compiled versions of xcdatamodel and xcdatamodeld files.
        self.managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] mutableCopy];
        self.managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:self.managedObjectModel];
        self.objectManager.managedObjectStore = self.managedObjectStore;
        
        /*
         Complete Core Data stack initialization
         */
        NSError *coreDataInitializationError;
        
        [self.managedObjectStore createPersistentStoreCoordinator];
        NSString *storePath = [RKApplicationDataDirectory() stringByAppendingPathComponent:storeName];
        NSString *seedPath = nil; // [[NSBundle mainBundle] pathForResource:@"RKSyndicateSeedDatabase" ofType:@"sqlite"];
        NSPersistentStore *persistentStore = [self.managedObjectStore addSQLitePersistentStoreAtPath:storePath
                                                                              fromSeedDatabaseAtPath:seedPath
                                                                                   withConfiguration:nil
                                                                                             options:nil
                                                                                               error:&coreDataInitializationError];
        // TODO: work out model versioning. Persistent store would be nil if the model has changed.
        if (!persistentStore) {
            NSLog(@"Failed to add persistent store with error: %@", coreDataInitializationError);
            NSError *fileRemovalError, *persistentStoreAddingAgainError;
            NSLog(@"Removing incompatible persistent store at path: %@", storePath);
            [[NSFileManager defaultManager] removeItemAtPath:storePath error:&fileRemovalError];
            if (!fileRemovalError) {
                persistentStore = [self.managedObjectStore addSQLitePersistentStoreAtPath:storePath
                                                                   fromSeedDatabaseAtPath:seedPath
                                                                        withConfiguration:nil options:nil
                                                                                    error:&persistentStoreAddingAgainError];
                NSAssert(persistentStore, @"Failed to add persistent store after deliting old one with error: %@", persistentStoreAddingAgainError);
            }
            else {
                NSLog(@"Cannot remove old store at path: %@\n error: %@", storePath, fileRemovalError);
            }
        }
        // Create the managed object contexts
        [self.managedObjectStore createManagedObjectContexts];
        
        // Configure a managed object cache to ensure we do not create duplicate objects
        self.managedObjectStore.managedObjectCache = [[RKInMemoryManagedObjectCache alloc] initWithManagedObjectContext:self.managedObjectStore.persistentStoreManagedObjectContext];
        
        /* completed Core Data stack initialization */
        
    }
    return self;
}

- (void)loadFeedAtPath:(NSString*)feedPath ofType:(RKSFeedType)feedType withRootKeyPath:(NSString*)rootKeyPath andParameters:(NSDictionary*)parameters andCompletionBlock:(void (^)(RKSFeed *feed, NSError *error, BOOL isOld))completionBlock
{
    ///////////////////////////
    // Setup mapping
    RKEntityMapping *feedMapping = [RKSMapper entityMappingForFeedType:feedType inManagedObjectStore:self.managedObjectStore];
    
    ////////////////////////////
    // Setup response descriptors
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:feedMapping
                                                                                            method:RKRequestMethodGET
                                                                                       pathPattern:feedPath
                                                                                           keyPath:rootKeyPath
                                                                                       statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    ////////////////////////////
    // Add response descriptors to manager
    [self.objectManager addResponseDescriptor:responseDescriptor];
    
    [self.objectManager getObjectsAtPath:feedPath parameters:parameters success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        id mappedFeed = [mappingResult firstObject];
        if ([mappedFeed isKindOfClass:[RKSFeed class]])
            completionBlock(mappedFeed, nil, NO);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Failure time");
        // TODO: possibly fetch older results on failure and send them marked as old
        // nil for now
        completionBlock(nil, error, YES);
    }];
}

@end
