//
//  AboutViewController.m
//  Cheap Recipes
//
//  Created by Mike Choi on 8/3/14.
//  Copyright (c) 2014 LifePlus Inc. All rights reserved.
//

#import "AboutViewController.h"
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>

@interface AboutViewController () <MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>
@property (nonatomic, assign) NSInteger idx;
@property (nonatomic, strong) NSArray *textValues;

@end

@implementation AboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.idx = 0;
    [self toggleTextForLabel:self.share_with_friends];
    self.share_with_friends.textAlignment = NSTextAlignmentCenter;
}

#pragma mark - toggling text

- (NSArray *)textValues
{
    if (!_textValues) {
        _textValues = @[
                        @"Share",
                        @"Share with Friends",
                        @"and",
                        @"share",
                        @"share the wealth!",
                        @""
                        ];
    }
    return _textValues;
}

- (void)setIdx:(NSInteger)idx
{
    _idx = MAX(0, MIN(idx, idx % [self.textValues count]));
}

- (void)toggleTextForLabel:(UILabel *)label
{
    self.share_with_friends.text = self.textValues[self.idx++];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self toggleTextForLabel:self.share_with_friends];
    });
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)feed_back:(id)sender {
    // Email Subject
    NSString *emailTitle = @"Feedback about Cheap Recipes Mobile";
    // Email Content
    NSString *messageBody = @"Hey, here's what I think: ";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"mkchoi212@icloud.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{

    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)facebook_button:(id)sender {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [controller setInitialText:@"Cheap Recipes: an iPhone app that allows you to make money-saving meals that fit your budget"];
        [self presentViewController:controller animated:YES completion:Nil];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                         message:[NSString stringWithFormat:@"Facebook is not available"]
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles: nil];
        [alert show];
    }
}

- (IBAction)twitter_button:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Cheap Recipes: an iPhone app that allows you to make money-saving meals that fit your budget"];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:[NSString stringWithFormat:@"Twitter is not available"]
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
    }
}

- (IBAction)text_button:(id)sender {
    if ([MFMessageComposeViewController canSendText]) {
        MFMessageComposeViewController *messageComposer =
        [[MFMessageComposeViewController alloc] init];
        NSString *message = @"Hey, check out Cheap Recipes on the App Store. It's pretty rad.";
        [messageComposer setBody:message];
        messageComposer.messageComposeDelegate = self;
        [self presentViewController:messageComposer animated:YES completion:nil];
    }
}
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)appstore_button:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com"]];
}

- (IBAction)mail_button:(id)sender {
    // Email Subject
    NSString *emailTitle = @"You have to try this recipe app...";
    // Email Content
    NSString *messageBody = @"Hey, \n I just found this great recipe iPhone app called Cheap Recipes.\n It shows recipes that fit your budget and it allows you to easily create shopping lists.\n You should definately check it out. Yeah, so I guess that's pretty cool... ";
    // To address
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}


@end
