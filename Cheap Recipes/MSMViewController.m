//
//  MSMViewController.m
//  Cheap Recipes
//
//  Created by Mike Choi on 7/29/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import "MSMViewController.h"

@interface MSMViewController ()

@end

@implementation MSMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.menuList =  @[@"HOME",
                       @"SEARCH",
                       @"FILTER & SEARCH",
                       @"MY FAVORITES",
                       @"SHOPPING LIST",
                       @"SETTINGS",
                       @"ABOUT"];

    
    self.leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,180,[self.view bounds].size.height)];
    self.leftTableView.separatorColor = [UIColor clearColor];
    [self.paperView setLeftFoldContentView:self.leftTableView foldCount:3 pullFactor:0.9];
    [self.leftTableView setRowHeight:70];
    [self.leftTableView setDataSource:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menuList count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row == 0){
        cell.imageView.image = [UIImage imageNamed:@"MyReallyCoolImage.png"];
    }
    
    if(tableView == self.leftTableView){
        [cell.textLabel setText:[self.menuList objectAtIndex:indexPath.row]];
        cell.textLabel.font = [UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:18.0f];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark paper fold delegate

- (void)paperFoldView:(id)paperFoldView didFoldAutomatically:(BOOL)automated toState:(PaperFoldState)paperFoldState
{
    NSLog(@"did transition to state %i automated %i", paperFoldState, automated);
}


@end
