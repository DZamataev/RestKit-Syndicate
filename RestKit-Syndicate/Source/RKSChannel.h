//
//  RKSChannel.h
//  RestKit-Syndicate
//
//  Created by Denis Zamataev on 2/18/14.
//  Copyright (c) 2014 DZamataev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RKSFeed, RKSImage, RKSItem;

@interface RKSChannel : NSManagedObject

@property (nonatomic, retain) NSString * descriptionAttribute;
@property (nonatomic, retain) NSString * docs;
@property (nonatomic, retain) NSString * generator;
@property (nonatomic, retain) NSString * language;
@property (nonatomic, retain) NSString * lastBuildDate;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * managingEditor;
@property (nonatomic, retain) NSString * pubDate;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * webMaster;
@property (nonatomic, retain) RKSFeed *feed;
@property (nonatomic, retain) RKSImage *image;
@property (nonatomic, retain) NSSet *items;
@end

@interface RKSChannel (CoreDataGeneratedAccessors)

- (void)addItemsObject:(RKSItem *)value;
- (void)removeItemsObject:(RKSItem *)value;
- (void)addItems:(NSSet *)values;
- (void)removeItems:(NSSet *)values;

@end
