//
//  OptionsTableViewController.m
//  Cheap Recipes
//
//  Created by Mike Choi on 8/3/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import "OptionsTableViewController.h"


@interface OptionsTableViewController ()

@end

@implementation OptionsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rate_app:(id)sender {
    
  //  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=<YOURAPPID>&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8"]];

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com"]];
}

@end