//
//  RKSMapper.h
//  RestKit-Syndicate
//
//  Created by Denis Zamataev on 2/18/14.
//  Copyright (c) 2014 DZamataev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/CoreData.h>
#import <RestKit.h>

@class RKSFeed, RKSChannel, RKSItem, RKSImage;

typedef enum { RKSFeedTypeRSS20 } RKSFeedType ;

@interface RKSMapper : NSObject
+ (RKEntityMapping*)entityMappingForFeedType:(RKSFeedType)feedType inManagedObjectStore:(RKManagedObjectStore*)store;
@end
