//
//  RKSFeedManager.h
//  RestKit-Syndicate
//
//  Created by Denis Zamataev on 2/17/14.
//  Copyright (c) 2014 DZamataev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit.h>

@class RKSFeed, RKSChannel, RKSItem, RKSImage;

@interface RKSFeedManager : NSObject
@property (nonatomic, strong) RKObjectManager *objectManager;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) RKManagedObjectStore *managedObjectStore;
@end
