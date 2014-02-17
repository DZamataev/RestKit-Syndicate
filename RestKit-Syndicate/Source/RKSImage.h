//
//  RKSImage.h
//  RestKit-Syndicate
//
//  Created by Denis Zamataev on 2/17/14.
//  Copyright (c) 2014 DZamataev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RKSChannel, RKSFeed, RKSItem;

@interface RKSImage : NSManagedObject

@property (nonatomic, retain) NSString * linkAttribute;
@property (nonatomic, retain) NSString * titleAttribute;
@property (nonatomic, retain) NSString * urlAttribute;
@property (nonatomic, retain) NSSet *channels;
@property (nonatomic, retain) NSSet *feeds;
@property (nonatomic, retain) NSSet *items;
@end

@interface RKSImage (CoreDataGeneratedAccessors)

- (void)addChannelsObject:(RKSChannel *)value;
- (void)removeChannelsObject:(RKSChannel *)value;
- (void)addChannels:(NSSet *)values;
- (void)removeChannels:(NSSet *)values;

- (void)addFeedsObject:(RKSFeed *)value;
- (void)removeFeedsObject:(RKSFeed *)value;
- (void)addFeeds:(NSSet *)values;
- (void)removeFeeds:(NSSet *)values;

- (void)addItemsObject:(RKSItem *)value;
- (void)removeItemsObject:(RKSItem *)value;
- (void)addItems:(NSSet *)values;
- (void)removeItems:(NSSet *)values;

@end
