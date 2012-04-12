//
//  AGZAbove.h
//  iPad_appgz
//
//  Created by appgz on 12-3-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AGZAboveViewController.h"
#import "AGZHomeViewController.h"
@interface AGZAbove : UIView  <UITableViewDelegate,UITableViewDataSource>
{
    UINavigationController * navigation;
    NSArray * array;
  
}

@property (nonatomic,assign)UIViewController *agzController;
@property (nonatomic,retain)AGZHomeViewController *home;
//@property (nonatomic,assign) AGZAboveController *aGZAboveController;
//@property (nonatomic,assign)AGZHomeViewController *homeViewController;
//@property (nonatomic,retain)AGZAboveViewController * next;





@end
