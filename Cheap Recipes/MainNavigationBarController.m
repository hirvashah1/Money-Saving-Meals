//
//  MainNavigationBarController.m
//  Cheap Recipes
//
//  Created by Mike Choi on 9/20/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import "MainNavigationBarController.h"

@interface MainNavigationBarController ()

@end

@implementation MainNavigationBarController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setTranslucent:NO];
    
    [self.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"TimesNewRomanPSMT" size:21],
      NSFontAttributeName, nil]];
    
    self.navigationBar.tintColor = [UIColor blackColor];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:@"HelveticaNeue" size:17.0],
      NSFontAttributeName,nil] forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
