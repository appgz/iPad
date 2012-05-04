//
//  AGZPopArticleView.m
//  iPad_appgz
//
//  Created by appgz on 12-5-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AGZPopArticleView.h"
#import <QuartzCore/QuartzCore.h>
@interface AGZPopArticleView ()

@end

@implementation AGZPopArticleView




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [self.view setBackgroundColor:[UIColor whiteColor]];
        self.view.layer.cornerRadius = 5;//设置弹出框为圆角视图
        self.view.layer.masksToBounds = YES;
        self.view.layer.borderWidth = 5; //设置弹出框视图的u边框宽度 
        self.view.layer.borderColor = [[UIColor colorWithRed:0.40 green:0.10 blue:0.10 alpha:0.5]CGColor];//设置弹出框边框颜色
               
        
        UIActivityIndicatorView * avt = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(100, 100, 24, 24)];
        [avt setColor:[UIColor redColor]];
        [self.view addSubview:avt];
        [avt startAnimating];
        [avt release];

        // Custom initialization
    }
    return self;
}
-(void)makeAnimation{
    NSLog(@"%s",__FUNCTION__);
    
    CATransition * animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.5f;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.fillMode = kCAFillModeForwards;
    
    //animation.type = kCATransitionPush;
    animation.type = kCATransitionMoveIn;
   // animation.subtype = kCATransition ;
    animation.subtype = kCATransitionFromTop;
    
    //[self.view addSubview:art.view];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
   // [[KCATransition.view layer]
   [ self.view.layer addAnimation:animation forKey:@"animation"];
}


-(void)onClickButton{
    [self.view removeFromSuperview];
    NSLog(@"ok");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(self.view.frame.origin.x+5, self.view.frame.origin.y+5, 25, 25)];
    [button setBackgroundColor:[UIColor redColor]];
    [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];//此按钮用来关闭此试图
    [button addTarget:self action:@selector(onClickButton) forControlEvents:UIControlEventTouchUpInside];
    button.tag =1;
    [self.view addSubview:button];

    [self makeAnimation];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
