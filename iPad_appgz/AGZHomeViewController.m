//
//  AGZHomeViewController.m
//  iPad_appgz
//
//  Created by appgz on 12-3-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AGZHomeViewController.h"


#import "AGZAbove.h"
#import "AGZTextViewController.h"


@interface AGZHomeViewController ()

@end

@implementation AGZHomeViewController
//@synthesize home;
@synthesize topImage;
@synthesize  logo;
@synthesize addButton,detailButton;
@synthesize scrollView;
@synthesize nav;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)toMesView:(id)sender{
    NSLog(@"%s",__FUNCTION__);
  AGZTextViewController * toMesView = [[AGZTextViewController alloc]init];
    [self.navigationController pushViewController:toMesView animated:YES];
    [toMesView release];
 
}


-(void)moveAddButton:(UIViewController * )sender addName:(NSString *)addname {
    
    
    sender.view.hidden = YES;
    
    
    UIButton * but = [UIButton buttonWithType:UIButtonTypeCustom];
    
//    UIView *view;
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(<#selector#>)];
//    [view addGestureRecognizer:tap];
    
    [but setBackgroundColor:[UIColor redColor]];
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
    [scrollView addSubview:but];
[UIView commitAnimations];
    
}
-(void)onClickButton:( id)sender{
    
    AGZMesViewController  * mes = [[AGZMesViewController alloc]init ];
    [self.navigationController pushViewController:mes animated:YES];
    [mes release];
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
        self.topImage.frame = CGRectMake(0, 0, 230, 768);
        self.logo.frame = CGRectMake(20, 20, 190, 100);
        self.scrollView.frame = CGRectMake(238, 0, 768, 768);
        
        self.nav.view.frame = CGRectMake(350, 160, 300, 435);
        
    }
    if (interfaceOrientation ==UIInterfaceOrientationPortrait||interfaceOrientation ==UIInterfaceOrientationPortraitUpsideDown) {
        self.topImage.frame = CGRectMake(0, 0, 768, 237);
        self.logo.frame = CGRectMake(20, 20, 228, 91);
        self.scrollView.frame =CGRectMake(0, 252, 768, 768);
        self.nav.view.frame = CGRectMake(230, 260, 300, 435);
      

    }
	return YES;
}

@end
