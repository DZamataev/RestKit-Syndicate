//
//  RKSFeed.h
//  RestKit-Syndicate
//
//  Created by Denis Zamataev on 2/18/14.
//  Copyright (c) 2014 DZamataev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RKSChannel, RKSImage;

@interface RKSFeed : NSManagedObject

@property (nonatomic, retain) NSString * version;
@property (nonatomic, retain) NSString * requestUrl;
@property (nonatomic, retain) NSSet *channels;
@property (nonatomic, retain) RKSImage *image;
@end

@interface RKSFeed (CoreDataGeneratedAccessors)

- (void)addChannelsObject:(RKSChannel *)value;
- (void)removeChannelsObject:(RKSChannel *)value;
- (void)addChannels:(NSSet *)values;
- (void)removeChannels:(NSSet *)values;

@end
