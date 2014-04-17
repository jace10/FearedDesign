//
//  FearedDesignViewController.m
//  FearedDesign
//
//  Created by Jason Mather on 8/1/12.
//  Copyright (c) 2012 Jason Mather. All rights reserved.
//

#import "FearedDesignViewController.h"

@interface FearedDesignViewController (){
    BOOL viewButtonIsUp;
}

@end

@implementation FearedDesignViewController
@synthesize portfolioOutlet;
@synthesize otherViewsView;
@synthesize viewButton;

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
    otherViewsView.layer.cornerRadius = 5.0;
    portfolioOutlet.layer.cornerRadius = 5.0;
    viewButton.layer.cornerRadius = 5.0;
    viewButton.clipsToBounds = YES;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)moveTabBar{
    if(viewButtonIsUp){
        [UIView animateWithDuration:.5 animations:^{
            otherViewsView.frame = CGRectOffset(otherViewsView.frame, 0, 205);
            
        }];
        viewButtonIsUp = NO;
    }else{
        [UIView animateWithDuration:.5 animations:^{
            otherViewsView.frame = CGRectOffset(otherViewsView.frame, 0, -205);
            
        }];
        viewButtonIsUp = YES;
    }
}

- (IBAction)sameButton:(id)sender {
    [self moveTabBar];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [self removeFromParentViewController];
}


- (IBAction)viewButtonTouch:(id)sender {
    [self moveTabBar];
    
}


@end
