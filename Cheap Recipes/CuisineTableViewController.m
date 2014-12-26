//
//  CuisineTableViewController.m
//  Cheap Recipes
//
//  Created by Mike Choi on 11/14/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import "CuisineTableViewController.h"
#import "ResultsViewController.h"

@interface CuisineTableViewController ()

@end

@implementation CuisineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSIndexPath *selectedIdx = [self.tableView indexPathForSelectedRow];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    ResultsViewController *detail = [storyboard instantiateViewControllerWithIdentifier:@"results"];
    detail.selectedIdx = selectedIdx;
    [self.navigationController pushViewController:detail animated:YES];
    
}@end
