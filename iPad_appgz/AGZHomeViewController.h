//
//  AGZHomeViewController.h
//  iPad_appgz
//
//  Created by appgz on 12-3-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGZMesViewController.h"
@class AGZAbove;
#import "AGZRootViewController.h"

@interface AGZHomeViewController : UIViewController<UIScrollViewDelegate>{
    
    UIImageView * logo,*list;
    UIImageView * topImage;
    UIScrollView * scrollView;
    
    IBOutlet UIButton * addButton;
    IBOutlet UIButton * firstBut;
    IBOutlet UIButton * scendBut;
    
    AGZAbove * abView;
    NSUserDefaults * userDefault;
    NSMutableArray  *butViewCenterArray;
    NSMutableArray *imgViewCenterArray;
    
    int addButtonTag;
    
    int addButBack;
    BOOL isShake;
    }

@property(nonatomic,retain)NSMutableArray *imgViewCenterArray;
@property(nonatomic,retain) NSMutableArray * butViewCenterArray;
@property(nonatomic,assign)AGZRootViewController * root;
@property(nonatomic,assign)UINavigationController * nav;

@property(nonatomic,retain)IBOutlet UIImageView * logo,*list;
@property(nonatomic,retain)IBOutlet UIImageView * topImage;
@property(nonatomic,retain)IBOutlet UIScrollView * scrollView;
@property(nonatomic,retain)IBOutlet UIButton * addButton;

//@property(nonatomic,assign) AGZHomeViewController *home;

-(IBAction)addView:(id)sender;
-(IBAction)toMesView:(id)sender;
-(void)moveAddButton:(id)sender addName:(NSString *)addname ;
-(void) onClickButton:(id)sender;
@end
