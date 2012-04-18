//
//  AGZTextViewController.m
//  iPad_appgz
//
//  Created by appgz on 12-4-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AGZTextViewController.h"
#import "JSON.h"
#import "AGZViewToImage.h"
@interface AGZTextViewController ()

@end

@implementation AGZTextViewController

@synthesize titleLable,titleLable2;
@synthesize  newsImg,newsInfo2;
@synthesize newsInfo,newsImg2;
//@synthesize dic;





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)dealloc{
   // [arr release];
    [super dealloc];
}

-(void)getDate{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://test.appgz.com/Subscribe_json/list_Handler.ashx?type=ntype&id=1&page=1"]];  
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];  
    
    NSString *jsonStr = [[NSString alloc] initWithData:response encoding:  NSUTF8StringEncoding]; 
    
    NSObject * obj = [jsonStr JSONValue];
    dic = (NSDictionary *)obj;
}
-(void)getImage:(NSString * )imageUrl{
    NSLog(@"%s",__FUNCTION__);
    NSString * urlString = [NSString stringWithFormat:imageUrl];
    
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    
    UIImage * image = [UIImage imageWithData:data];
    if (image) {
        NSArray * array = [NSArray arrayWithObject:image];
        NSLog(@"<<<<<<<<<<<++++++%@",[array objectAtIndex:0]);
        [self performSelectorOnMainThread:@selector(fillImage:) withObject:array waitUntilDone:YES];
        NSLog(@"<<<<<<<<<<<++++++");
    }
    
    
//    NSLog(@"<<<<<<<<<<<++++++%@",data);
}
-(void)fillImage:(NSArray * ) arr{
    
    NSLog(@"%s",__FUNCTION__);
    UIImageView *ima =self.newsImg;
    if (ima) 
        NSLog(@"祝贺你！等着图片加上%@",[arr objectAtIndex:0] );
        ima.image = [arr objectAtIndex:0];
    for (id  obj in ima.subviews) {
        if ([obj isKindOfClass:[UIActivityIndicatorView class]]) {
            [obj removeFromSuperview];
        }
    }
    if (!ima) {
        NSLog(@"他奶奶的");
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self getDate];

    
    NSArray * arr = [dic valueForKey:@"newsInfo"];
    NSArray * arr2 = [dic valueForKey:@"newsTitle"];
    NSArray * arrImg = [dic valueForKey:@"newsImg"];
    
    [NSThread detachNewThreadSelector:@selector(getImage:) toTarget:self withObject:[arrImg objectAtIndex:0]];
    
    
    
     // [arr addObject: [  dic valueForKey:@"newsInfo"]];
    
   // [ arr addObject:[dic valueForKey:@"newsTitle"]]; 
 
   // for (int i=0; i<[array count]; i++) {
    
    //}
  
    newsInfo.text = [arr objectAtIndex:0];
    newsInfo.editable = NO;
   // newsInfo.backgroundColor = [UIColor clearColor];
     [newsImg setBackgroundColor:[UIColor clearColor]];
    UIActivityIndicatorView * avt = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(100, 100, 24, 24)];
    [newsImg addSubview:avt];
    [avt startAnimating];
    [avt release];
    titleLable.text = [arr2 objectAtIndex:0];
    
    
    newsInfo2.Text=[arr objectAtIndex:0];
    newsInfo2.editable = NO;
    // newsInfo.backgroundColor = [UIColor clearColor];
    
    
   
    [newsImg2 setImage:[UIImage imageNamed:@"image.jpeg"]];
    titleLable2.text =[arr2 objectAtIndex:0];
    
    
    
    //SBJsonParser * parser = [[SBJsonParser alloc]init];
    //NSDictionary * json = [parser objectWithString:jsonStr error:nil];
    //arr = [jsonStr JSONValue];
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
    if (interfaceOrientation ==UIInterfaceOrientationLandscapeLeft||interfaceOrientation ==UIInterfaceOrientationLandscapeRight) {
        self.titleLable.frame =CGRectMake(40, 35, 411, 72);
        self.titleLable2.frame = CGRectMake(596, 52, 411, 72);
        self.newsInfo.frame = CGRectMake(39, 392, 411, 288);
        self.newsInfo2.frame = CGRectMake(596, 392, 411, 288);
        self.newsImg.frame = CGRectMake(40, 156, 411, 202);
        self.newsImg2.frame = CGRectMake(596, 156, 411, 202);
                                          
    }
    if (interfaceOrientation ==UIInterfaceOrientationPortrait||interfaceOrientation ==UIInterfaceOrientationPortraitUpsideDown) {
        self.titleLable.frame = CGRectMake(20, 50, 340, 90);
        self.titleLable2.frame = CGRectMake(20, 580, 340, 90);
        self.newsInfo.frame = CGRectMake(20, 170, 340, 200);
        self.newsInfo2.frame = CGRectMake(20, 650, 340,200);
        self.newsImg.frame = CGRectMake(377, 90, 370, 280);
        self.newsImg2.frame = CGRectMake(377, 545, 370, 280);
    }
	return YES;
}

@end
