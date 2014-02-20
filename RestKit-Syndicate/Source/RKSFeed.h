//
//  RKSFeed.h
//  RestKit-Syndicate
//
//  Created by Denis Zamataev on 2/20/14.
//  Copyright (c) 2014 DZamataev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RKSChannel, RKSImage;

@interface RKSFeed : NSManagedObject

@property (nonatomic, retain) NSString * requestUrl;
@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) NSOrderedSet *channels;
@property (nonatomic, retain) RKSImage *image;
@end

@interface RKSFeed (CoreDataGeneratedAccessors)

- (void)insertObject:(RKSChannel *)value inChannelsAtIndex:(NSUInteger)idx;
- (void)removeObjectFromChannelsAtIndex:(NSUInteger)idx;
- (void)insertChannels:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeChannelsAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInChannelsAtIndex:(NSUInteger)idx withObject:(RKSChannel *)value;
- (void)replaceChannelsAtIndexes:(NSIndexSet *)indexes withChannels:(NSArray *)values;
- (void)addChannelsObject:(RKSChannel *)value;
- (void)removeChannelsObject:(RKSChannel *)value;
- (void)addChannels:(NSOrderedSet *)values;
- (void)removeChannels:(NSOrderedSet *)values;
@end
