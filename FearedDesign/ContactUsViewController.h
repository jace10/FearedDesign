//
//  ContactUsViewController.h
//  FearedDesign
//
//  Created by Jason Mather on 8/1/12.
//  Copyright (c) 2012 Jason Mather. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <Social/Social.h>

@interface ContactUsViewController : UIViewController <UITextViewDelegate,MFMailComposeViewControllerDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIView *otherViewsView;
@property (weak, nonatomic) IBOutlet UIButton *plusButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *portfolioOutlet;
- (IBAction)plusButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *txtRequest;
@property (weak, nonatomic) IBOutlet UIButton *envelopeOutlet;
- (IBAction)dragEnded:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imgMail;
- (IBAction)draggedOutside:(id)sender forEvent:(UIEvent *)event;
- (IBAction)sameButton:(id)sender;
- (IBAction)actionEmailComposer;
@property (weak, nonatomic) IBOutlet UIView *socialView;
@property (weak, nonatomic) IBOutlet UIButton *facebookOutlet;
- (IBAction)socialExpand:(id)sender;
-(IBAction)tweetButtonPressed:(id)sender;
- (IBAction)fbLikeButton:(id)sender;

@end
