//
//  ContactUsViewController.m
//  FearedDesign
//
//  Created by Jason Mather on 8/1/12.
//  Copyright (c) 2012 Jason Mather. All rights reserved.
//

#import "ContactUsViewController.h"

@interface ContactUsViewController (){
    BOOL viewButtonIsUp;
    BOOL socialExpanded;
    UIActionSheet *actionSheet;

}


@end

@implementation ContactUsViewController
@synthesize socialView;
@synthesize facebookOutlet;
@synthesize imgMail;
@synthesize txtRequest;
@synthesize envelopeOutlet;
@synthesize otherViewsView;
@synthesize plusButtonOutlet;
@synthesize portfolioOutlet;



- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    viewButtonIsUp = NO;
    socialExpanded = NO;
    imgMail.layer.cornerRadius = 5.0;
    facebookOutlet.layer.cornerRadius = 20.0;
    facebookOutlet.clipsToBounds = YES;
    socialView.layer.cornerRadius = 20.0;
    
    otherViewsView.layer.cornerRadius = 5.0;
    portfolioOutlet.layer.cornerRadius = 5.0;
    plusButtonOutlet.layer.cornerRadius = 5.0;
    plusButtonOutlet.clipsToBounds = YES;
    txtRequest.layer.cornerRadius = 5.0;
    [txtRequest.layer setBorderWidth:2.0];
    [txtRequest.layer setBorderColor:[[UIColor blackColor]CGColor]];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)plusButton:(id)sender {
    [self moveTabBar];
    
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if ([text isEqualToString:@"\n"]) {
        // Be sure to test for equality using the "isEqualToString" message
        [textView resignFirstResponder];
        [envelopeOutlet setHidden:NO];
        [imgMail setHidden:NO];
        actionSheet = [[UIActionSheet alloc] initWithTitle:@"Drag the Envelope to the Box to Send an Email, You Will Have Another Chance to Edit Your Text." delegate:nil cancelButtonTitle:@"OK" destructiveButtonTitle:nil otherButtonTitles: nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        [self performSelector:@selector(dismissActionSheet) withObject:nil afterDelay:2.0];
        [actionSheet showFromRect:CGRectMake(0, 480, 320, 0) inView:self.view animated:YES];
        // Return FALSE so that the final '\n' character doesn't get added
        return FALSE;
    }
    // For any other character return TRUE so that the text gets added to the view
    return TRUE;
}

-(void)dismissActionSheet{
    
    [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
}


- (IBAction)dragEnded:(id)sender {
    
    if(!((CGRectContainsPoint(imgMail.frame, envelopeOutlet.center)))){
        
        
        double x = envelopeOutlet.center.x - 70;
        double y = envelopeOutlet.center.y - 351.5;
        [UIView animateWithDuration:.5 animations:^{
            
            envelopeOutlet.frame = CGRectOffset(envelopeOutlet.frame, -x, -y);
        }];
    }else if(CGRectContainsPoint(imgMail.frame, envelopeOutlet.center)){
        [self actionEmailComposer];
    }
}

- (IBAction)draggedOutside:(id)sender forEvent:(UIEvent *)event {
    
    
    envelopeOutlet.center = [[[event allTouches] anyObject] locationInView:self.view];
    if(CGRectContainsPoint(imgMail.frame, envelopeOutlet.center)){
        
        
    }
    
}

-(void)moveTabBar{
    if(viewButtonIsUp){
        [UIView animateWithDuration:.5 animations:^{
            otherViewsView.frame = CGRectOffset(otherViewsView.frame, 205, 0);
            
        }];
        viewButtonIsUp = NO;
    }else{
        [UIView animateWithDuration:.5 animations:^{
            otherViewsView.frame = CGRectOffset(otherViewsView.frame, -205, 0);
            
        }];
        viewButtonIsUp = YES;
    }
}

- (IBAction)sameButton:(id)sender {
    [self moveTabBar];
}

- (IBAction)actionEmailComposer {
    
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setToRecipients:[NSArray arrayWithObjects:@"Ry@FearedDesign.com",@"Tom@FearedDesign.com",nil]];
        [mailViewController setSubject:@"Project Description"];
        [mailViewController setMessageBody:txtRequest.text isHTML:NO];
        
        [self presentViewController:mailViewController animated:YES completion:^{
        
        }];
        
        
        
    }  else {
        
        NSLog(@"Device is unable to send email in its current state.");
        
    }
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}






- (IBAction)socialExpand:(id)sender {
    if(socialExpanded){
        [UIView animateWithDuration:.5 animations:^{
            socialView.frame = CGRectOffset(socialView.frame, 115, 0);
            
        }];
        socialExpanded = NO;
    }else{
        [UIView animateWithDuration:.5 animations:^{
            socialView.frame = CGRectOffset(socialView.frame, -115, 0);
            
        }];
        socialExpanded = YES;
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [self removeFromParentViewController];
}
- (IBAction)tweetButtonPressed:(id)sender
{
    
    SLComposeViewController *twitterHandler = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
            [twitterHandler dismissViewControllerAnimated:YES completion:nil];
            
            switch(result){
                case SLComposeViewControllerResultCancelled:
                default:
                {
                    NSLog(@"Cancelled.....");
                    
                }
                    break;
                case SLComposeViewControllerResultDone:
                {
                    NSLog(@"Posted....");
                }
                    break;
            }};
        
        [twitterHandler addImage:[UIImage imageNamed:@"1343697523.png"]];

        [twitterHandler setInitialText:@"Check out fearedDesign!"];
        [twitterHandler addURL:[NSURL URLWithString:@"http://bit.ly/MT0KUg"]];
        [twitterHandler setCompletionHandler:completionHandler];
        [self presentViewController:twitterHandler animated:YES completion:nil];
    }
}

- (IBAction)fbLikeButton:(id)sender {
    
    SLComposeViewController *fbController=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
            
            [fbController dismissViewControllerAnimated:YES completion:nil];
            
            switch(result){
                case SLComposeViewControllerResultCancelled:
                default:
                {
                    NSLog(@"Cancelled.....");
                    
                }
                    break;
                case SLComposeViewControllerResultDone:
                {
                    NSLog(@"Posted....");
                }
                    break;
            }};
        
        [fbController addImage:[UIImage imageNamed:@"1343697523.png"]];
        [fbController setInitialText:@"Check out fearedDesign"];
        [fbController addURL:[NSURL URLWithString:@"http://bit.ly/MT0KUg"]];
        [fbController setCompletionHandler:completionHandler];
        [self presentViewController:fbController animated:YES completion:nil];
    }
}


@end
