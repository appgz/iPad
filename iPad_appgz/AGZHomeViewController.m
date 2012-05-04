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
#import <QuartzCore/QuartzCore.h>
#import "AGZRootViewController.h"
static const CGFloat kWobbleRadians = 1.5;
static const NSTimeInterval kWobbleTime = 0.07;

@interface AGZHomeViewController ()

@end

@implementation AGZHomeViewController

@synthesize butViewCenterArray,imgViewCenterArray;
@synthesize topImage;
@synthesize  logo,list;
@synthesize addButton;
@synthesize scrollView;
@synthesize nav;
@synthesize root;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
           }
    return self;
}

-(void)dealloc{
    [butViewCenterArray release];
    [imgViewCenterArray release];
    [scrollView release];
    [super dealloc];
}

-(IBAction)toMesView:(id)sender{
    NSLog(@"%s",__FUNCTION__);
    if (isShake ==NO) {
     
    root = [[AGZRootViewController alloc]init ];
    [self.navigationController pushViewController:root animated:YES];
    [root release];
    }
    
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"来这里");
    
}

-(void)text:(UIButton *)sender{
    NSLog(@"这个but的tag是：%d",sender.tag );
}
//添加喜好
-(void)moveAddButton:(UIViewController * )sender addName:(NSString *)addname {
    
   
    NSLog(@"%s",__FUNCTION__);
    UIButton * but = [UIButton buttonWithType:UIBarStyleDefault];
    sender.view.hidden = YES;
   
    [but  setTag:addButtonTag];
    but.imageView.tag = but.tag;

    addButtonTag++;

    [but setBackgroundImage:[UIImage imageNamed:@"239x239-2.png"] forState:UIControlStateNormal];
    //[but setImage:[UIImage imageNamed:@"239x239-2.png"] forState:UIControlStateNormal] ;
    // [but setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [but setFrame:CGRectMake(addButton.frame.origin.x, addButton.frame.origin.y, 240, 240)];
   
    NSValue *butValue = [NSValue valueWithCGPoint:but.center];
 
    [but addTarget:self action:@selector(toMesView:) forControlEvents:UIControlEventTouchUpInside];   
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationTransition:UIUserInterfaceLayoutDirectionRightToLeft forView:but.imageView cache:YES];
    [UIView setAnimationDuration:1.0];

     if (addButton.frame.origin.x + 252 >=768) {
        addButton.frame = CGRectMake(12 , addButton.frame.origin.y + 252, 240, 240);
    }else {
        addButton.frame = CGRectMake(addButton.frame.origin.x + 252, addButton.frame.origin.y, 240, 240);
    }

     [butViewCenterArray addObject:butValue];
    
    //给but添加长按手势
    UILongPressGestureRecognizer * longPressRecognizer = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPress:)];
    longPressRecognizer.allowableMovement = 30;
    [but addGestureRecognizer:longPressRecognizer];
    [longPressRecognizer release];
    
    [scrollView addSubview:but];
    [UIView commitAnimations];

    
//    NSArray * ar = [NSArray arrayWithObjects:addButton ,nil];
//    NSUserDefaults * userDefault = [NSUserDefaults standardUserDefaults];
//    [userDefault setObject:ar forKey:@"bu" ];


/*  
 把addButton添加到数组中
 NSValue *addButtonValue = [NSValue valueWithCGPoint:addButton.center];
   
    if ([butViewCenterArray count]<2) {
     [butViewCenterArray addObject:butValue];
    [butViewCenterArray addObject:addButtonValue];
    }else {
        [butViewCenterArray removeObjectAtIndex:[butViewCenterArray count]-1];
        [butViewCenterArray addObject:butValue];
        [butViewCenterArray addObject:addButtonValue];
    }
 NSLog(@"%d*******%d",[butViewCenterArray count],[butViewCenterArray indexOfObject:addButtonValue]);

  */  
               /*    userDefault = [NSUserDefaults standardUserDefaults];
    
    NSArray * a = [NSArray arrayWithObjects:@"516",@"12",@"240",@"240", nil];
    
  //  CGPoint  p =CGPointMake(addButton.center.x, addButton.center.y);
   [userDefault setBool:YES forKey:@"NCUserDefaultBoolForRegister"];
    [userDefault setObject:a  forKey:@"a"]; //forKey:@"buttonadded"];
 */ 
    
}


//长按
-(void)handleLongPress:(UILongPressGestureRecognizer*)longPressRecognizer{
    NSLog(@"%s",__FUNCTION__);
    if (longPressRecognizer.state == UIGestureRecognizerStateBegan) {
        if (isShake ==NO) {
 
            [self addDeleteView];
    
            UIBarButtonItem *doneButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(stopShake)];
            [self.navigationItem setRightBarButtonItem:doneButtonItem];
     
            [doneButtonItem release];
            //isShake = YES;
            // [self shakeView];
        }
    }
}
//添加删除按钮
-(void)addDeleteView{
    UIImageView *deleteImg = nil;
//UIButton *deleteButton = nil;

    
    for (UIView *tempView in scrollView.subviews) {
        
        if (tempView.tag !=999&&tempView.tag !=0&&tempView.tag !=33) {
            if ([tempView isKindOfClass:[UIButton class]]) {
            
        
            deleteImg =[ [UIImageView alloc]initWithFrame:CGRectMake(tempView.frame.origin.x-25,tempView.frame.origin.y - 25,50, 50)];
            [deleteImg setImage:[UIImage imageNamed:@"close.png"]];
                
            deleteImg.tag = tempView.tag;
               
            [scrollView addSubview:deleteImg];
            deleteImg.userInteractionEnabled = YES;
            
            UITapGestureRecognizer * tap = [[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(deletea:)]autorelease];
            [deleteImg addGestureRecognizer:tap];
            
            
            NSValue *tempValue2 = [NSValue valueWithCGPoint:deleteImg.center];
            [imgViewCenterArray addObject:tempValue2];
               
            [deleteImg release];
            
            }
        
        }
        NSLog(@"图片数组个数%d",[imgViewCenterArray count] );
    }
  
    
}

//删除
-(void)deletea:(UITapGestureRecognizer *)sender{
   // if (sender.state == UIGestureRecognizerStateBegan||sender.state ==UIGestureRecognizerStateEnded){
    
    
    NSLog(@"%s",__FUNCTION__);
    	
	NSMutableArray *tempButViewArray = [NSMutableArray arrayWithArray:butViewCenterArray];
	NSMutableArray *tempImgViewArray = [NSMutableArray arrayWithArray:imgViewCenterArray];

     
	[UIView beginAnimations:@"movement" context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
	[UIView setAnimationDuration:1.0f];
	
	UIView *tempView = nil;
    
    //删除but and img；

	do {
        tempView = [scrollView viewWithTag:[sender.view tag]];
        [tempView removeFromSuperview];
      
       
	} while (tempView);

	CGPoint tempViewCenter;
	int butViewIndex = 0;
	int imgViewIndex = 0;
    for (tempView in [scrollView subviews]) {
        
        if (tempView.tag !=999&&tempView.tag!=0&&tempView.tag!=33) {
            
            if ([tempView isKindOfClass:[UIButton class]]) {
                
                
                tempViewCenter = [[tempButViewArray objectAtIndex:butViewIndex] CGPointValue];
                butViewIndex ++;
                
                
            } else if ([tempView isKindOfClass:[UIImageView class]]) {
                tempViewCenter = [[tempImgViewArray objectAtIndex:imgViewIndex] CGPointValue];
                imgViewIndex ++;
                
            }
            tempView.center = tempViewCenter;
            
            
        }  
        
    }
    
    addButton.center = [[tempButViewArray objectAtIndex:[tempButViewArray count]-addButBack]CGPointValue];
    addButBack++;
    [UIView commitAnimations];

}


- (void)shakeView {
    
    static BOOL wobblesLeft = NO;
	
	if (isShake) {
		CGFloat rotation = (kWobbleRadians * M_PI) / 180.0;
		CGAffineTransform wobbleLeft = CGAffineTransformMakeRotation(rotation);
		CGAffineTransform wobbleRight = CGAffineTransformMakeRotation(-rotation);
		
		[UIView beginAnimations:nil context:nil];
		
		NSInteger i = 0;
		NSInteger nWobblyButtons = 0;  
        
        for (UIView *tempView in [scrollView subviews]) {
			if ([tempView isKindOfClass:[UIButton class]]) {
				++nWobblyButtons;
				if (i % 2) {
					tempView.transform = wobblesLeft ? wobbleRight : wobbleLeft;
				} else {
					tempView.transform = wobblesLeft ? wobbleLeft : wobbleRight;
				}
				++i;
			}
            if ([tempView isKindOfClass:[UIImageView class]]) {
				++nWobblyButtons;
				if (i % 2) {
					tempView.transform = wobblesLeft ? wobbleRight : wobbleLeft;
				} else {
					tempView.transform = wobblesLeft ? wobbleLeft : wobbleRight;
				}
				++i;
			}

          
		}
		
		if (nWobblyButtons >= 1) {
			[UIView setAnimationDuration:kWobbleTime];
			[UIView setAnimationDelegate:self];
			[UIView setAnimationDidStopSelector:@selector(shakeView)];
			wobblesLeft = !wobblesLeft;
			
		} else {
			[NSObject cancelPreviousPerformRequestsWithTarget:self];
			[self performSelector:@selector(shakeView) withObject:nil afterDelay:kWobbleTime];
		}
		
		[UIView commitAnimations];
    }
}
//停止晃动
- (void)stopShake {
	isShake = NO;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.3f];
    //	[UIView setAnimationDelegate:self];
	
	for (UIView *tempView in [scrollView subviews]) {
		tempView.transform = CGAffineTransformIdentity;
	}
	[UIView commitAnimations];
	
	for (UIView *tempView in [scrollView subviews]) {
		if ([tempView isKindOfClass:[UIImageView class]]) {
			[tempView removeFromSuperview];
            
		}
        
	}
    
    
    self.navigationItem.rightBarButtonItem=nil;
}


-(void)onClickButton:( id )sender{
    
    AGZTextViewController * toMesView = [[AGZTextViewController alloc]init];
    [self.navigationController pushViewController:toMesView animated:YES];
    [toMesView release];

   }


-(IBAction)addView:(UIButton *)sender{
    NSLog(@"%s",__FUNCTION__);
    if (sender.center.x ==636&&sender.center.y ==1392) {
        NSLog(@"你妹的别点了");
        return;
    }
    if (isShake ==NO ) {
       
        UIViewController *viewController = [[UIViewController alloc]init];
        
        if (abView==nil) {
             NSLog(@"这里");
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
        [self.view addSubview:nav.view];
        
        [UIView commitAnimations];
        

 /*   UIButton * but = [UIButton buttonWithType:UIButtonTypeCustom];
    [but setBackgroundColor:[UIColor redColor]];
    but.frame = CGRectMake(180, 5, 40, 30);
    [but addTarget:nil action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [nav.view addSubview:but];
    
 */   
    
    
  //  [nav.navigationItem setLeftBarButtonItem: [self editButtonItem]];
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    [UIView beginAnimations:@"Curl" context:context];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    [UIView setAnimationDuration:0.5];

//    [abView release];
    
    
    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationCurve:UIViewAnimationOptionTransitionFlipFromLeft];
//    [UIView setAnimationDuration:3.0];
    //    [self.view addSubview:abView];
 //   [UIView commitAnimations];
    }    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    addButtonTag = 1;
    addButBack = 1;
    self.navigationController.navigationBarHidden = NO;
    [scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height*2)];
    [scrollView setBackgroundColor:[UIColor clearColor]];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"769x1024.png"]];
    [firstBut.imageView setTag:999];
    [scendBut.imageView setTag:999];
    NSLog(@"%d%d",firstBut.imageView.tag,scendBut.imageView.tag);
    
    butViewCenterArray = [[NSMutableArray alloc]init ];
    imgViewCenterArray = [[NSMutableArray alloc]init];
    
    
  
   
 /*   for (UIView *tempView in scrollView.subviews) {
        if ([tempView isKindOfClass:[UIButton class]]) {
            
            
            NSValue *butValue = [NSValue valueWithCGPoint:tempView.center];
            
            [butViewCenterArray addObject:butValue];
            
            [butValue release];
            
        }
        
    }  
    NSLog(@"数组在这呢。来拿啊%@\n",butViewCenterArray);
  */  
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeInfoLight];
    button.frame = CGRectMake(30, 39, 40, 40);
    [button addTarget:nil action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setTag:88];
    
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"%s",__FUNCTION__);
    [super viewWillAppear:animated];
  
    [self shouldAutorotateToInterfaceOrientation:[[UIDevice currentDevice] orientation]];
    
}
-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"%s",__FUNCTION__);  
    [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
      NSLog(@"%s",__FUNCTION__);
    [super viewWillDisappear:animated];
//    NSArray * ar = [NSArray arrayWithObjects: addButton, nil];
//     userDefault = [NSUserDefaults standardUserDefaults];
//    [userDefault setObject:ar forKey:@"but"];
//    [userDefault synchronize];
    
}
-(void)viewDidDisappear:(BOOL)animated{
      NSLog(@"%s",__FUNCTION__);
    [super viewDidDisappear:animated];
    
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)){
        NSLog(@"%s",__FUNCTION__);
    }
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
