//
//  AGZAboveViewController.h
//  iPad_appgz
//
//  Created by appgz on 12-4-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AGZHomeViewController ;

@interface AGZAboveViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray * arr;
}






@property (nonatomic,retain) NSArray* arr;
@property (nonatomic,retain) AGZHomeViewController * home;

-(void)setValue:(UITableViewCell *)cell;


@end
