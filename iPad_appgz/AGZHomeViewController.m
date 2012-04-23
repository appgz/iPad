//
//  AGZHomeViewController.m
//  iPad_appgz
//
//  Created by appgz on 12-3-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#define LOADIMAGE(file,ext)[UIImage imageWithContentsOfFile:[NSbundle mainBundle]pathForResource:file oftype: ext]] 
#import "AGZHomeViewController.h"
#import "AGZAbove.h"
#import "AGZTextViewController.h"

#import "AGZRootViewController.h"


@interface AGZHomeViewController ()

@end

@implementation AGZHomeViewController

@synthesize topImage;
@synthesize  logo,list;
@synthesize addButton,detailButton;
@synthesize scrollView;
@synthesize nav;
@synthesize root;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        if(  [userDefault boolForKey:@"NCUserDefaultBoolForRegister"]==YES){
      NSLog(@"%@",  [userDefault objectForKey:@"a" ]);
            NSLog(@"你妹的");
        }
        
        [self moveAddButton:nil addName:nil];
    
    }
    return self;
}

-(IBAction)toMesView:(id)sender{
    NSLog(@"%s",__FUNCTION__);
    root = [[AGZRootViewController alloc]init ];
    [self.navigationController pushViewController:root animated:YES];
    [root release];
    
    
}


-(void)moveAddButton:(UIViewController * )sender addName:(NSString *)addname {
    
    
    sender.view.hidden = YES;
    
    
    UIButton * but = [UIButton buttonWithType:UIButtonTypeCustom];
    
//    UIView *view;
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(<#selector#>)];
//    [view addGestureRecognizer:tap];
    
    [but setImage:[UIImage imageNamed:@"239x239-2.png"] forState:UIControlStateNormal] ;
    [but setTitle:addname forState:UIControlStateNormal];
    [but setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [but setFrame:CGRectMake(addButton.frame.origin.x, addButton.frame.origin.y, 240, 240)];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationTransition:UIUserInterfaceLayoutDirectionRightToLeft forView:but.imageView cache:YES];
    [UIView setAnimationDuration:1.0];
     
    
        
     if (addButton.frame.origin.x + 252 >=768) {
        addButton.frame = CGRectMake(12 , addButton.frame.origin.y + 252, 240, 240);
    }else {
        addButton.frame = CGRectMake(addButton.frame.origin.x + 252, addButton.frame.origin.y, 240, 240);
    }
    
//    NSArray * ar = [NSArray arrayWithObjects:addButton ,nil];
//    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
//    [userDefault setObject:ar forKey:@"bu" ];

    [scrollView addSubview:but];
    [UIView commitAnimations];
    userDefault = [NSUserDefaults standardUserDefaults];
    
    NSArray * a = [NSArray arrayWithObjects:@"516",@"12",@"240",@"240", nil];
    
  //  CGPoint  p =CGPointMake(addButton.center.x, addButton.center.y);
   [userDefault setBool:YES forKey:@"NCUserDefaultBoolForRegister"];
    [userDefault setObject:a  forKey:@"a"]; //forKey:@"buttonadded"];
    
}

-(void)onClickButton:( id)sender{
    
    AGZTextViewController * toMesView = [[AGZTextViewController alloc]init];
    [self.navigationController pushViewController:toMesView animated:YES];
    [toMesView release];

   }
-(IBAction)addView:(id)sender{
 
 
    
    UIViewController *viewController = [[UIViewController alloc]init];
    
    if (abView==nil) {
        
    
    abView = [[AGZAbove alloc]initWithFrame:CGRectMake(230, 260, 300, 435)];
    abView.home = self;
    
    abView.agzController = viewController;
   
    viewController.view = abView;
    
//   self.aGZHomeViewController =abView.aGZAboveController;
    
    
    [abView release];
    
    nav = [[UINavigationController alloc]initWithRootViewController:viewController];
        
    nav.view.frame = CGRectMake(260, 260, 300, 435);
    }else {
        self.nav.view.hidden= NO;
    }
    
    
    
 /*   UIButton * but = [UIButton buttonWithType:UIButtonTypeCustom];
    [but setBackgroundColor:[UIColor redColor]];
    but.frame = CGRectMake(180, 5, 40, 30);
    [but addTarget:nil action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [nav.view addSubview:but];
    
 */   
    
    
  //  [nav.navigationItem setLeftBarButtonItem: [self editButtonItem]];
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:@"Curl" context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.5];
 //   CGRect rect = [abView frame];
//    if (rect.origin.x>0) {
//        NSLog(@"222222222");
//        rect.origin.x = 26.0f - rect.size.width;
//    }else {
//        rect.origin.x = 26.0f;
//        NSLog(@"3333333333");
//    }
//    [abView setFrame:rect];
    
    [self.view addSubview:nav.view];
    
    [UIView commitAnimations];
    
//    [abView release];
    
    
    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationCurve:UIViewAnimationOptionTransitionFlipFromLeft];
//    [UIView setAnimationDuration:3.0];
    //    [self.view addSubview:abView];
 //   [UIView commitAnimations];
        
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    [self.scrollView setBackgroundColor:[UIColor clearColor]];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"769x1024.png"]];
    
  
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeInfoLight];
    button.frame = CGRectMake(30, 39, 40, 40);
   // [button addTarget:nil  action:@selector(toMesView:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:nil action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    if (interfaceOrientation==UIInterfaceOrientationLandscapeRight||interfaceOrientation == UIInterfaceOrientationLandscapeLeft){
        
        
        self.topImage.frame = CGRectMake(0, 0, 230, 705);
        self.logo.frame = CGRectMake(10, 20, 210, 57);
                self.scrollView.frame = CGRectMake(238, 0, 768, 768);
        
        self.list.frame = CGRectMake(100, 90, 102, 26);
        self.nav.view.frame = CGRectMake(350, 160, 300, 435);
        
        self.list.image = [UIImage imageNamed:@"102x26.png"];
        self.topImage.image = [UIImage imageNamed:@"230x705.jpg"];
        self.logo.image = [UIImage imageNamed:@"210x57.png"];

        
    }
    if (interfaceOrientation ==UIInterfaceOrientationPortrait||interfaceOrientation ==UIInterfaceOrientationPortraitUpsideDown) {
        
   
        self.topImage.frame = CGRectMake(0, 0, 768, 183);
        self.logo.frame = CGRectMake(20, 20, 379, 101);
        self.scrollView.frame =CGRectMake(0, 183, 768, 831);
        self.nav.view.frame = CGRectMake(230, 260, 300, 435);
        self.list.frame = CGRectMake(590, 120, 136, 34);
        
        self.list.image = [UIImage imageNamed:@"136x34.png"];
        self.topImage.image = [UIImage imageNamed:@"768x183.jpg"];
        self.logo.image = [UIImage imageNamed:@"379x101.png"];

    }
	return YES;
}

@end
