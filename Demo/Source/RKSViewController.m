//
//  RKSViewController.m
//  RestKit-Syndicate
//
//  Created by Denis Zamataev on 1/20/14.
//  Copyright (c) 2014 DZamataev. All rights reserved.
//

#import "RKSViewController.h"
#import "RKSFeedManager.h"

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
    self.feedManager = [[RKSFeedManager alloc] initWithUrl:[NSURL URLWithString:self.feedUrlTextField.text]
                                              andStoreName:self.storeNameTextField.text];
}
@end
