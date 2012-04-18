//
//  AGZModelController.h
//  iPad_appgz
//
//  Created by appgz on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AGZDataViewController;

@interface AGZModelController : NSObject<UIPageViewControllerDataSource>
-(AGZDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(AGZDataViewController *)viewController;
@end
