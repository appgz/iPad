//
//  AGZDataViewController.m
//  iPad_appgz
//
//  Created by appgz on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AGZDataViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface AGZDataViewController ()

@end

@implementation AGZDataViewController
@synthesize dataObject = _dataObject;
@synthesize dataLabel =_dataLabel;
@synthesize titleLabel = _titleLabel,titleLabel2 = _titleLabel2;
@synthesize  newsImg = _newsImg,newsImg2 = _newsImg2;
@synthesize gameImg = _gameImg,gameImg2 = _gameImg2;
@synthesize newsInfo = _newsInfo,newsInfo2 = _newsInfo2;
@synthesize popArticleView =_popArticleView;
-(void)dealloc{
    [_gameImg release];
    [_gameImg2 release];
    [_dataLabel release];
    [_dataObject release];
    [_titleLabel release];
    [_titleLabel2 release];
    [_newsInfo2 release];
    [_newsInfo release];
    [_newsImg release];
    [_newsImg2 release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)popFrame{
    NSLog(@"%s",__FUNCTION__);
    _popArticleView = [[AGZPopArticleView alloc]init];
    _popArticleView.view.frame =CGRectMake(30, 30, 708, 944);    
    [self.view addSubview:_popArticleView.view];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"769x1024.png"]]; 
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(popFrame)];
    [self.newsInfo addGestureRecognizer:tap];
    
  
    //self.view.backgroundColor = [UIColor clearColor];
    
//    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 340, 90)];
//    _titleLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 545, 340, 90)];
//    _newsImg = [[UIImageView alloc]initWithFrame:CGRectMake(377, 90, 370, 280)];
//    _newsImg2 = [[UIImageView alloc]initWithFrame:CGRectMake(377, 545, 370, 280)];
//    _newsInfo = [[UITextView alloc]initWithFrame:CGRectMake(20, 170, 340, 200)];
//    _newsInfo2 = [[UITextView alloc]initWithFrame:CGRectMake(20, 650, 340,200)];
//
//    [_newsImg setBackgroundColor:[UIColor redColor]];
//    
//    [_newsImg2 setBackgroundColor:[UIColor redColor]];
//    _newsInfo.editable = NO;
//    _newsInfo2.editable = NO;
//    [ self.view addSubview:_titleLabel];
//    [self.view addSubview:_titleLabel2];
//    [self.view addSubview:_newsImg];
//    [self.view addSubview:_newsImg2];
//    [self.view addSubview:_newsInfo];
//    [self.view addSubview:_newsInfo2];

    _newsInfo.backgroundColor = [UIColor clearColor];
    _newsInfo2.backgroundColor = [ UIColor clearColor];
                
    _newsInfo.editable = NO;
    _newsInfo2.editable = NO;
    [_gameImg setBackgroundColor:[UIColor grayColor]];
    
    [_gameImg2 setBackgroundColor:[UIColor grayColor]];
     
    [_newsImg setBackgroundColor:[UIColor cyanColor]];
    
    
    //给游戏图标添加点击事件
    UITapGestureRecognizer * t =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(popFrame)];
    [_gameImg addGestureRecognizer:t];
     
    
   
    UIActivityIndicatorView * avt = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(100, 100, 24, 24)];
    [_newsImg addSubview:avt];
    [avt startAnimating];
    [avt release];
    
    [_newsImg2 setBackgroundColor:[UIColor cyanColor]];
    UIActivityIndicatorView * avt2 = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(100, 100, 24, 24)];
    [_newsImg2 addSubview:avt2];

    [avt2 startAnimating];
    [avt2 release];
    
    
 /*    arr = [self.dataObject valueForKey:@"newsTitle"];
     arr2 = [self.dataObject valueForKey:@"newsInfo"];
   arrImg = [self.dataObject valueForKey:@"newsImg"];
  [NSThread detachNewThreadSelector:@selector(getImage:) toTarget:self withObject:[arrImg objectAtIndex:0]];
   */ 	// Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"%s",__FUNCTION__);
   
    [super viewWillAppear:animated];
   
    self.dataLabel.text = [self.dataObject description];
       
   // NSLog(@"------------%@",[self.dataObject valueForKey:@"appName"]);

 /*   _newsInfo.text = [arr2 objectAtIndex:0];
    _newsInfo2.text = [arr2 objectAtIndex:0]; 
    [_titleLabel setText:[arr objectAtIndex:0]];
    [_titleLabel2 setText:[arr objectAtIndex:0]];
  */
}

    
    

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%s",__FUNCTION__);
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if (orientation==UIInterfaceOrientationPortrait) {
       
    }
    
    
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"%s",__FUNCTION__);
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"%s",__FUNCTION__);
	[super viewDidDisappear:animated];
}


-(void)getImage:(NSString * )imageUrl{
    NSLog(@"%s",__FUNCTION__);
    NSString * urlString = [NSString stringWithFormat:imageUrl];
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    
    UIImage * image = [UIImage imageWithData:data];
    if (image) {
        NSArray * array = [NSArray arrayWithObject:image];
       
        [self performSelectorOnMainThread:@selector(fillImage:) withObject:array waitUntilDone:YES];
    
    }
    
    
    //    NSLog(@"<<<<<<<<<<<++++++%@",data);
}
-(void)fillImage:(NSArray * ) array{
    
    NSLog(@"%s",__FUNCTION__);
    UIImageView *ima =self.newsImg;
    if (ima) 

    ima.image = [array objectAtIndex:0];
    
    _newsImg2 = [array objectAtIndex:0];
    for (id  obj in ima.subviews) {
        if ([obj isKindOfClass:[UIActivityIndicatorView class]]) {
            [obj removeFromSuperview];
        }
    }
    if (!ima) {
        NSLog(@"他奶奶的");
    }
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    if (interfaceOrientation==UIInterfaceOrientationLandscapeLeft||interfaceOrientation ==UIInterfaceOrientationLandscapeRight) {
        
        _gameImg.frame = CGRectMake(20, 30, 72, 72);
        
        
        _titleLabel.frame = CGRectMake(100, 30, 215, 90);
        _newsInfo.frame = CGRectMake(20, 125, 230, 200);
        _newsImg.frame = CGRectMake(256, 125, 240, 200);
        
        _gameImg2.frame = CGRectMake(20, 390, 72, 72);
        _titleLabel2.frame = CGRectMake(100, 384, 215, 90);
        _newsInfo2.frame = CGRectMake(20, 479, 230, 200);
        _newsImg2.frame = CGRectMake(256, 479, 240, 200);
     
        //_popArticleView.view.frame = CGRectMake(30, 30, 950, 750);
    }else {
        _gameImg.frame = CGRectMake(40, 40, 72, 72);
        _gameImg2.frame = CGRectMake(40, 520, 72, 72);
        _titleLabel.frame = CGRectMake(180, 35, 566, 72);
        _titleLabel2.frame = CGRectMake(180, 520, 566, 72);
        _newsInfo.frame = CGRectMake(20, 130, 355, 280);
        _newsInfo2.frame = CGRectMake(20, 620, 355,280);
        _newsImg.frame = CGRectMake(390, 130, 358, 280);
        _newsImg2.frame = CGRectMake(390, 620, 358, 280);
       
    }
    
	return YES;
}

@end
