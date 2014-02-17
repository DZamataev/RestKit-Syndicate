//
//  RKSViewController.h
//  RestKit-Syndicate
//
//  Created by Denis Zamataev on 1/20/14.
//  Copyright (c) 2014 DZamataev. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RKSFeedManager;

@interface RKSViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *feedUrlTextField;
@property (strong, nonatomic) IBOutlet UITextField *storeNameTextField;
@property (strong, nonatomic) RKSFeedManager *feedManager;
- (IBAction)loadFeed:(id)sender;
@end
