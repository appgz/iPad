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

@interface AGZHomeViewController : UIViewController{
    UIImageView * logo;
 
    UIImageView * topImage;
    UIScrollView * scrollView;
    
    UIButton * addButton;
    AGZAbove * abView;
    

    }



@property(nonatomic,assign)AGZRootViewController * root;
@property(nonatomic,assign)UINavigationController * nav;
@property(nonatomic,retain)IBOutlet UIImageView * backgroundImage;
@property(nonatomic,retain)IBOutlet UIImageView * logo;
@property(nonatomic,retain)IBOutlet UIImageView * topImage;
@property(nonatomic,retain)IBOutlet UIScrollView * scrollView;
@property(nonatomic,retain)IBOutlet UIButton * addButton;
@property(nonatomic,retain)IBOutlet UIButton * detailButton;
//@property(nonatomic,assign) AGZHomeViewController *home;

-(IBAction)addView:(id)sender;
-(IBAction)toMesView:(id)sender;

-(void)moveAddButton:(id)sender addName:(NSString *)addname ;

-(void) onClickButton:(id)sender;
@end
