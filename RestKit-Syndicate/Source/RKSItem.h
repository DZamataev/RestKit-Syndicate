//
//  RKSItem.h
//  RestKit-Syndicate
//
//  Created by Denis Zamataev on 2/17/14.
//  Copyright (c) 2014 DZamataev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class RKSChannel, RKSImage;

@interface RKSItem : NSManagedObject

@property (nonatomic, retain) NSString * descriptionAttribute;
@property (nonatomic, retain) NSString * guidAttribute;
@property (nonatomic, retain) NSString * linkAttribute;
@property (nonatomic, retain) NSString * pubDateAttribute;
@property (nonatomic, retain) NSString * titleAttribute;
@property (nonatomic, retain) RKSChannel *channel;
@property (nonatomic, retain) RKSImage *image;

@end
