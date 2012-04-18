//
//  AGZTextViewController.h
//  iPad_appgz
//
//  Created by appgz on 12-4-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGZHomeViewController.h"

@interface AGZTextViewController : UIViewController{
    UILabel * titleLable;
    UIImageView * newsImg;
    UITextView * newsInfo;
    
    
    NSDictionary *dic;
    //NSMutableArray * arr;
    
    
    UILabel * titleLable2;
    UIImageView * newsImg2;
    UITextView * newsInfo2;
    
    
}

//@property(nonatomic,retain) NSDictionary * dic;
@property(nonatomic,retain) IBOutlet UILabel * titleLable, *titleLable2;
@property(nonatomic,retain) IBOutlet UIImageView * newsImg,* newsImg2;

@property(nonatomic,retain) IBOutlet UITextView * newsInfo,* newsInfo2;


@end
