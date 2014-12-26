//
//  MainViewSupportingController.m
//  Cheap Recipes
//
//  Created by Mike Choi on 7/30/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import "MainViewSupportingController.h"
//#import <UIViewController+ScrollingNavbar.h>

@interface MainViewSupportingController ()
@property (weak, nonatomic) IBOutlet UIView *collection_container;

@end

@implementation MainViewSupportingController

- (void)viewDidLoad
{
    //[self followScrollView:self.collection_container withDelay:40];
    [super viewDidLoad];
}

/*- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self showNavBarAnimated:NO];
}
 */

- (void)didReceiveMemoryWarning{

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
