//
//  RKSViewController.m
//  RestKit-Syndicate
//
//  Created by Denis Zamataev on 1/20/14.
//  Copyright (c) 2014 DZamataev. All rights reserved.
//

#import "RKSViewController.h"

@interface RKSViewController ()

@end

@implementation RKSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadFeed:(id)sender {
    NSURL *feedURL = [NSURL URLWithString:self.feedUrlTextField.text];
    self.resultTextView.text = [NSString stringWithFormat:@"Loading feed with base '%@://%@' path '%@'", feedURL.scheme, feedURL.host, feedURL.path];
    
    self.feedManager = [[RKSFeedManager alloc] initWithUrl:[NSURL URLWithString: [NSString stringWithFormat:@"%@://%@", feedURL.scheme, feedURL.host]]
                                              andStoreName:self.storeNameTextField.text];
    [self.feedManager loadFeedAtPath:feedURL.path ofType:RKSFeedTypeRSS20 withRootKeyPath:@"rss" andParameters:nil
                  andCompletionBlock:^(RKSFeed *feed, NSError *error, BOOL isOld) {
                      NSMutableString *textResultMS = @"".mutableCopy;
                      if (error) {
                          [textResultMS appendString:[NSString stringWithFormat:@"Error: %@", error]];
                      }
                      [textResultMS appendString:[NSString stringWithFormat:@"\nis loded result old (cached) or fresh (newly loaded): %@", isOld?@"old":@"fresh"]];
                      [textResultMS appendString:@"\nThe result of mapping is:"];
                      if (!feed) {
                          [textResultMS appendString:@"\nnothing"];
                      }
                      else {
                          [textResultMS appendString:@"\nfeed"];
                          [textResultMS appendString:[NSString stringWithFormat:@" %@", feed.requestUrl]];
                          if (feed.image) [textResultMS appendString:@" (with image)"];
                          for (RKSChannel *channel in feed.channels) {
                              [textResultMS appendString:@"\n  channel"];
                              [textResultMS appendString:[NSString stringWithFormat:@" %@", channel.title]];
                              if (channel.image) [textResultMS appendString:@" (with image)"];
                              for (RKSItem *item in channel.items) {
                                  [textResultMS appendString:@"\n    item"];
                                  [textResultMS appendString:[NSString stringWithFormat:@" %@", item.title]];
                                  if (item.image) [textResultMS appendString:@" (with image)"];
                              }
                          }
                      }
                      self.resultTextView.text = [NSString stringWithString:textResultMS];
                               
                            
                      
    }];
}
@end
