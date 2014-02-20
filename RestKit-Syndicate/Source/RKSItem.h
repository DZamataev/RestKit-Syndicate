//
//  RKSItem.h
//  RestKit-Syndicate
//
//  Created by Denis Zamataev on 2/20/14.
//  Copyright (c) 2014 DZamataev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RKSChannel, RKSImage;

@interface RKSItem : NSManagedObject

@property (nonatomic, retain) NSString * descriptionAttribute;
@property (nonatomic, retain) NSString * guid;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * pubDate;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) RKSChannel *channel;
@property (nonatomic, retain) RKSImage *image;

@end
