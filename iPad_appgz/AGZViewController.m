//
//  AGZViewController.m
//  iPad_appgz
//
//  Created by appgz on 12-3-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AGZViewController.h"
#import "NetWork.h"
@interface AGZViewController ()

@end

@implementation AGZViewController
@synthesize AnimatedView,logoImage;
@synthesize button;

- (void)viewDidLoad
{
    [super viewDidLoad];
    if([NetWork connectedToNetWork]==YES){
        NSLog(@"网络可用");
    }
    self.navigationController.navigationBarHidden=YES;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"769x1024.png"]];
    [self loadImage];

           	// Do any additional setup after loading the view, typically from a nib.
}
//图片幻灯片
-(void)loadImage{

    myImages = [NSArray arrayWithObjects:
                         [UIImage imageNamed:@"1-11.jpg"],
                         [UIImage imageNamed:@"1-12.jpg"],
                         [UIImage imageNamed:@"1-13.jpg"],
                         [UIImage imageNamed:@"1-14.jpg"],
                         [UIImage imageNamed:@"1-15.jpg"],
                         nil];
    
 
     AnimatedView.animationImages = myImages;
    AnimatedView.animationDuration = 20; // seconds
    AnimatedView.animationRepeatCount = 0; // 0 代表一直循环。
    [AnimatedView startAnimating];
 
    
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
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"%s",__FUNCTION__);
    [super viewWillAppear:animated];
    [self shouldAutorotateToInterfaceOrientation:[[UIDevice currentDevice] orientation]];
    
}

//旋转屏幕
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation==UIInterfaceOrientationLandscapeRight||interfaceOrientation==UIInterfaceOrientationLandscapeLeft){
        self.logoImage.frame = CGRectMake(20, 20, 210, 57);
        self.logoImage.image = [UIImage imageNamed:@"210x57.png"];
        self.AnimatedView.frame = CGRectMake(250, 0, 520, 768);
        self.button.frame = CGRectMake(800, 600, 180, 40);
    }
        if (interfaceOrientation==UIInterfaceOrientationPortrait||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown)  {
            self.logoImage.frame = CGRectMake(20, 20, 379, 101);
            self.logoImage.image = [UIImage imageNamed:@"379x101.png"];
        self.AnimatedView.frame = CGRectMake(0, 0, 768, 1024);
            self.button.frame = CGRectMake(550, 840, 180, 40);
    }
    
    return YES;
}

@end
