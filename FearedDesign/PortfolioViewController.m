//
//  PortfolioViewController.m
//  FearedDesign
//
//  Created by Jason Mather on 8/1/12.
//  Copyright (c) 2012 Jason Mather. All rights reserved.
//

#import "PortfolioViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface PortfolioViewController (){
    BOOL viewButtonIsUp;
    NSMutableArray *portfolioPics;
}


@end

@implementation PortfolioViewController
@synthesize scrollView;
@synthesize otherViewsView;
@synthesize plusButtonOutlet;
@synthesize portfolioOutlet;



- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        portfolioPics = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"9794439_orig.png"],[UIImage imageNamed:@"4292168_orig.png"],[UIImage imageNamed:@"5843299_orig.png"],[UIImage imageNamed:@"6127712_orig.png"],[UIImage imageNamed:@"1131929_orig.png"],[UIImage imageNamed:@"4837893_orig.png"],[UIImage imageNamed:@"3600578_orig.png"],[UIImage imageNamed:@"9773181_orig.png"],[UIImage imageNamed:@"2208136_orig.png"], nil];
    }
    return self;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [self removeFromParentViewController];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    double currentX = 0;
    double currentY = 0;
    
    for(UIImage *image in portfolioPics){
        if(currentY + image.size.height>440){
            [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width, scrollView.contentSize.height+image.size.height)];

        }
        double ratio = image.size.width/image.size.height;
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(scrollView.frame.origin.x, currentY, scrollView.frame.size.width,scrollView.frame.size.width*ratio)];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        if(button.frame.origin.y > 440){
            [button setAlpha:.5];
        }else{
            [button setAlpha:1.0];
        }
        [button addTarget:self action:@selector(imageButtonSelect:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button];
        currentX = currentX + button.frame.size.height;
        
    }
    viewButtonIsUp = NO;
    otherViewsView.layer.cornerRadius = 5.0;
    portfolioOutlet.layer.cornerRadius = 5.0;
    plusButtonOutlet.layer.cornerRadius = 5.0;
    plusButtonOutlet.clipsToBounds = YES;
	// Do any additional setup after loading the view.
}

-(IBAction)imageButtonSelect:(id)sender{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)plusButton:(id)sender {
    [self moveTabBar];

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
@end
