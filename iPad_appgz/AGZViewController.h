//
//  AGZViewController.h
//  iPad_appgz
//
//  Created by appgz on 12-3-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGZHomeViewController.h"

@interface AGZViewController : UIViewController
{
    NSArray *myImages;
    UIButton * button;
}
@property (nonatomic,retain)IBOutlet UIButton * button;
@property (nonatomic,retain)IBOutlet UIImageView * AnimatedView,*logoImage;

-(IBAction)toHomeView:(id)sender;

@end
