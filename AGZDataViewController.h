//
//  AGZDataViewController.h
//  iPad_appgz
//
//  Created by appgz on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AGZPopArticleView.h"
@interface AGZDataViewController : UIViewController{


    UILabel * titleLabel,*titleLabel2;
    UIImageView * newsImg,*newsImg2;
    UITextView * newsInfo,*newsInfo2;
    NSArray * arr,* arr2,* arrImg;
    
    UIImageView * gameImg,*gameImg2;
}

@property(nonatomic,retain) AGZPopArticleView * popArticleView;
@property(nonatomic,retain)IBOutlet UILabel * titleLabel, *titleLabel2;
@property(nonatomic,retain)IBOutlet UIImageView * newsImg,* newsImg2;
@property(nonatomic,retain)IBOutlet UITextView * newsInfo,* newsInfo2;
@property(nonatomic,retain)IBOutlet UIImageView *gameImg,*gameImg2;

@property (strong, nonatomic) id dataObject;
@property (strong, nonatomic)  UILabel *dataLabel;
@end
