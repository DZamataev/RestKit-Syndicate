//
//  RKSChannel.h
//  RestKit-Syndicate
//
//  Created by Denis Zamataev on 2/17/14.
//  Copyright (c) 2014 DZamataev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RKSFeed, RKSImage, RKSItem;

@interface RKSChannel : NSManagedObject

@property (nonatomic, retain) NSString * descriptionAttribute;
@property (nonatomic, retain) NSString * docsAttribute;
@property (nonatomic, retain) NSString * generatorAttribute;
@property (nonatomic, retain) NSString * languageAttribute;
@property (nonatomic, retain) NSString * lastBuildDateAttribute;
@property (nonatomic, retain) NSString * linkAttribute;
@property (nonatomic, retain) NSString * managingEditorAttribute;
@property (nonatomic, retain) NSString * pubDateAttribute;
@property (nonatomic, retain) NSString * titleAttribute;
@property (nonatomic, retain) NSString * webMasterAttribute;
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
