//
//  AGZViewController.m
//  iPad_appgz
//
//  Created by appgz on 12-3-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AGZViewController.h"

@interface AGZViewController ()

@end

@implementation AGZViewController
@synthesize AnimatedView;
@synthesize button;





- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self loadImage];
    
    

    
    
           	// Do any additional setup after loading the view, typically from a nib.
}
//图片幻灯片
-(void)loadImage{
    
       
    NSArray *myImages = [NSArray arrayWithObjects:
                    
                         [UIImage imageNamed:@"1-11.jpg"],
                         [UIImage imageNamed:@"1-12.jpg"],
                         [UIImage imageNamed:@"1-13.jpg"],
                         [UIImage imageNamed:@"1-14.jpg"],
                         [UIImage imageNamed:@"1-15.jpg"],
                         nil];
    
  //  UIImageView *AnimatedView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 768, 1024)];
     AnimatedView.animationImages = myImages;
    AnimatedView.animationDuration = 20; // seconds
    AnimatedView.animationRepeatCount = 0; // 0 代表一直循环。
    [AnimatedView startAnimating];
 //   [self.view addSubview:AnimatedView];
    
    [AnimatedView release];
}
//进入首页
-(IBAction)toHomeView:(id)sender{
   
    
    AGZHomeViewController * homeView = [[AGZHomeViewController alloc]initWithNibName:@"AGZHomeViewController" bundle:nil];
    [self.navigationController pushViewController:homeView animated:YES];
    
 
    [homeView release];
  
    
    
    
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    
  
    // Release any retained subviews of the main view.
}


//旋转屏幕
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation==UIInterfaceOrientationLandscapeRight||interfaceOrientation==UIInterfaceOrientationLandscapeLeft){
        self.AnimatedView.frame = CGRectMake(250, 0, 520, 768);
        self.button.frame = CGRectMake(800, 600, 180, 40);
    }
        if (interfaceOrientation==UIInterfaceOrientationPortrait||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown)  {
        self.AnimatedView.frame = CGRectMake(0, 0, 768, 1024);
            self.button.frame = CGRectMake(550, 840, 180, 40);
    }
    
    return YES;
}

@end
