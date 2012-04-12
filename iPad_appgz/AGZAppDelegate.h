//
//  AGZAppDelegate.h
//  iPad_appgz
//
//  Created by appgz on 12-3-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AGZViewController;
@class LeavesViewController;

@interface AGZAppDelegate : UIResponder <UIApplicationDelegate,UINavigationControllerDelegate>{

    UINavigationController * navigationController;
  
}

@property (strong, nonatomic)IBOutlet UIWindow *window;
@property (strong, nonatomic)IBOutlet UINavigationController * navigationController;


@end
