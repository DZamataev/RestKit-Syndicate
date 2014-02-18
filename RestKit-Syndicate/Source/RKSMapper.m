//
//  RKSMapper.m
//  RestKit-Syndicate
//
//  Created by Denis Zamataev on 2/18/14.
//  Copyright (c) 2014 DZamataev. All rights reserved.
//

#import "RKSMapper.h"

#import "RKSFeed.h"
#import "RKSChannel.h"
#import "RKSItem.h"
#import "RKSImage.h"

@implementation RKSMapper

+ (RKEntityMapping*)entityMappingForFeedType:(RKSFeedType)feedType inManagedObjectStore:(RKManagedObjectStore *)mostore
{
    RKEntityMapping *result = nil;
    switch (feedType) {
        case RKSFeedTypeRSS20:
        {
            RKEntityMapping *imageMapping = [RKEntityMapping mappingForEntityForName:@"Image" inManagedObjectStore:mostore];
            [imageMapping addAttributeMappingsFromDictionary:@{@"link.__text" : @"link",
                                                               @"title.__text" : @"title",
                                                               @"url.__text" : @"url"}];
            imageMapping.identificationAttributes = @[ @"title", @"url", @"link" ];
            
            RKEntityMapping *itemMapping = [RKEntityMapping mappingForEntityForName:@"Item" inManagedObjectStore:mostore];
            [itemMapping addAttributeMappingsFromDictionary:@{@"description.__text" : @"descriptionAttribute",
                                                              @"guid.__text" : @"guid",
                                                              @"link.__text" : @"link",
                                                              @"pubDate.__text" : @"pubDate",
                                                              @"title.__text" : @"title" }];
            itemMapping.identificationAttributes = @[ @"title", @"guid", @"link", @"pubDate" ];
            
            RKEntityMapping *channelMapping = [RKEntityMapping mappingForEntityForName:@"Channel" inManagedObjectStore:mostore];
            [channelMapping addAttributeMappingsFromDictionary:@{@"description.__text" : @"descriptionAttribute",
                                                                 @"docs.__text" : @"docs",
                                                                 @"generator.__text" : @"generator",
                                                                 @"language.__text" : @"language",
                                                                 @"lastBuildDate.__text" : @"lastBuildDate",
                                                                 @"link.__text" : @"link",
                                                                 @"managingEditor.__text" : @"managingEditor",
                                                                 @"pubDate.__text" : @"pubDate",
                                                                 @"title.__text" : @"title",
                                                                 @"webMaster.__text" : @"webMaster"}];
            channelMapping.identificationAttributes = @[ @"title", @"link", @"pubDate" ];
            
            RKEntityMapping *feedMapping = [RKEntityMapping mappingForEntityForName:@"Feed" inManagedObjectStore:mostore];
            [feedMapping addAttributeMappingsFromDictionary:@{@"_version" : @"version",
                                                              @"@metadata.HTTP.request.URL.absoluteString": @"requestUrl"}];
            feedMapping.identificationAttributes = @[ @"requestUrl" ];
            
            // relationships
            
            [feedMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"channel" toKeyPath:@"channels" withMapping:channelMapping]];
            [feedMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"image" toKeyPath:@"image" withMapping:imageMapping]];
            [channelMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"item" toKeyPath:@"items" withMapping:itemMapping]];
            [channelMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"image" toKeyPath:@"image" withMapping:imageMapping]];
            [itemMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"image" toKeyPath:@"image" withMapping:imageMapping]];
            
            result = feedMapping;
        }
            break;
            
        default:
            break;
    }
    return result;
}
@end
