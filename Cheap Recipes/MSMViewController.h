//
//  MSMViewController.h
//  Cheap Recipes
//
//  Created by Mike Choi on 7/29/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MSMViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, PaperFoldViewDelegate>

@property (strong, nonatomic) IBOutlet PaperFoldView *paperView;
@property (nonatomic, strong) UITableView *leftTableView;

@property (nonatomic, strong) NSArray *menuList;

@end
