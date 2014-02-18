//
//  RKSViewController.h
//  RestKit-Syndicate
//
//  Created by Denis Zamataev on 1/20/14.
//  Copyright (c) 2014 DZamataev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestKitSyndicate.h"

@interface RKSViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *feedUrlTextField;
@property (strong, nonatomic) IBOutlet UITextField *storeNameTextField;
@property (strong, nonatomic) IBOutlet UITextView *resultTextView;
@property (strong, nonatomic) RKSFeedManager *feedManager;
- (IBAction)loadFeed:(id)sender;
@end
