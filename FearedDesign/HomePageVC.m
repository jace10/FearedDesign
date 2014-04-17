//
//  HomePageVC.m
//  FearedDesign
//
//  Created by Jason Mather on 8/1/12.
//  Copyright (c) 2012 Jason Mather. All rights reserved.
//

#import "HomePageVC.h"

@interface HomePageVC (){
    UIActionSheet *actionSheet;
}

@end

@implementation HomePageVC
@synthesize blueCircleButton;
@synthesize imgHome;
@synthesize imgContactUs;
@synthesize imgPortfolio;
@synthesize imgTeam;
@synthesize imgBackground;

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    actionSheet = [[UIActionSheet alloc] initWithTitle:@"Drag the Blue Circle to Your Intended Destination" delegate:nil cancelButtonTitle:@"OK" destructiveButtonTitle:nil otherButtonTitles: nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [self performSelector:@selector(dismissActionSheet) withObject:nil afterDelay:2.0];
    [actionSheet showFromRect:CGRectMake(0, 480, 320, 0) inView:self.view animated:YES];
    
    
    [UIView animateWithDuration:.2 animations:^{
        blueCircleButton.alpha = .5;
    }completion:^(BOOL finished){
        [UIView animateWithDuration:.2 animations:^{
            blueCircleButton.alpha = 1.0;
        }completion:^(BOOL finished){
            [UIView animateWithDuration:.2 animations:^{
                blueCircleButton.alpha = .5;
            }completion:^(BOOL finished){
                [UIView animateWithDuration:.2 animations:^{
                    blueCircleButton.alpha = 1.0;
                }completion:^(BOOL finished){
                    [UIView animateWithDuration:.2 animations:^{
                        blueCircleButton.alpha = .5;
                    }completion:^(BOOL finished){
                        [UIView animateWithDuration:.2 animations:^{
                            blueCircleButton.alpha = 1.0;
                        }completion:^(BOOL finished){
                            [UIView animateWithDuration:.2 animations:^{
                                blueCircleButton.alpha = .5;
                            }completion:^(BOOL finished){
                                [UIView animateWithDuration:.2 animations:^{
                                    blueCircleButton.alpha = 1.0;
                                }completion:^(BOOL finished){
                                    
                                }];
                            }];
                        }];
                    }];
                }];
            }];
        }];
    }];
    
    [blueCircleButton addTarget:self action:@selector(draggedOut:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [blueCircleButton addTarget:self action:@selector(dragEnded:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
	// Do any additional setup after loading the view.
}

- (IBAction)draggedOut: (id)sender withEvent: (UIEvent *) event {
    
    
    CGRect rightChoice = imgTeam.frame;
    CGRect leftChoice = imgContactUs.frame;
    CGRect topChoice = imgHome.frame;
    CGRect bottomChoice = imgPortfolio.frame;
    
    blueCircleButton.center = [[[event allTouches] anyObject] locationInView:self.view];
    if(CGRectContainsPoint(rightChoice, blueCircleButton.center)){
        [self unFadeSlightly:imgTeam];
        [self fadeSlightly:imgHome];
        [self fadeSlightly:imgPortfolio];
        [self fadeSlightly:imgBackground];
        [self fadeSlightly:imgContactUs];
        
    }
    if(CGRectContainsPoint(leftChoice, blueCircleButton.center)){
        [self unFadeSlightly:imgContactUs];
        
        [self fadeSlightly:imgHome];
        [self fadeSlightly:imgPortfolio];
        [self fadeSlightly:imgBackground];
        
        [self fadeSlightly:imgTeam];
    }
    if(CGRectContainsPoint(bottomChoice, blueCircleButton.center)){
        [self unFadeSlightly:imgPortfolio];
        [self fadeSlightly:imgHome];
        [self fadeSlightly:imgTeam];
        [self fadeSlightly:imgBackground];
        
        [self fadeSlightly:imgContactUs];
    }
    if(CGRectContainsPoint(topChoice, blueCircleButton.center)){
        [self unFadeSlightly:imgHome];
        [self fadeSlightly:imgBackground];
        
        [self fadeSlightly:imgContactUs];
        [self fadeSlightly:imgPortfolio];
        
        [self fadeSlightly:imgTeam];
        
    }
    
    
    
    
}

-(IBAction)dragEnded:(id)sender{
    
    if(!((CGRectContainsPoint(imgHome.frame, blueCircleButton.center))||(CGRectContainsPoint(imgPortfolio.frame, blueCircleButton.center))||(CGRectContainsPoint(imgTeam.frame, blueCircleButton.center))||(CGRectContainsPoint(imgContactUs.frame, blueCircleButton.center)))){
        [self unFadeSlightly:imgContactUs];
        [self unFadeSlightly:imgPortfolio];
        [self unFadeSlightly:imgHome];
        [self unFadeSlightly:imgTeam];
        [self unFadeSlightly:imgBackground];
        
        double x = blueCircleButton.center.x - self.view.center.x;
        double y = blueCircleButton.center.y - self.view.center.y;
        [UIView animateWithDuration:.5 animations:^{
            
            blueCircleButton.frame = CGRectOffset(blueCircleButton.frame, -x, -y);
        }];
    }else if(CGRectContainsPoint(imgHome.frame, blueCircleButton.center)){
        [self performSegueWithIdentifier:@"toFearedDesignSegue" sender:self];
    }else if(CGRectContainsPoint(imgTeam.frame, blueCircleButton.center)){
        [self performSegueWithIdentifier:@"toTeamSegue" sender:self];
    }else if(CGRectContainsPoint(imgContactUs.frame, blueCircleButton.center)){
        [self performSegueWithIdentifier:@"toContactUsSegue" sender:self];
    }else if(CGRectContainsPoint(imgPortfolio.frame, blueCircleButton.center)){
        [self performSegueWithIdentifier:@"toPortfolioSegue" sender:self];
    }
}

-(void)fadeSlightly: (UIView*)view{
    [UIView animateWithDuration:.5 animations:^{
        [view setBackgroundColor:[UIColor lightGrayColor]];
        [view setAlpha:.7];
    }];
}

-(void)unFadeSlightly: (UIView*)view{
    [UIView animateWithDuration:.5 animations:^{
        [view setBackgroundColor:[UIColor whiteColor]];
        [view setAlpha:1.0];
    }];
}

-(void)dismissActionSheet{
    
    [actionSheet dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
