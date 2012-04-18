//
//  AGZModelController.m
//  iPad_appgz
//
//  Created by appgz on 12-4-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AGZModelController.h"

#import "AGZDataViewController.h"

#import "JSON.h"

@interface AGZModelController ()
@property (readonly,strong,nonatomic) NSMutableArray *pageData;
@property (readonly,strong,nonatomic) NSDictionary * gameData;
@end

@implementation AGZModelController

@synthesize pageData =_pageData;
@synthesize gameData = _gameData;
-(id)init{
    self = [super init];
    if (self) {
        //_pageData = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
       // NSDateFormatter * dateFormatter = [[[NSDateFormatter alloc]init]autorelease];
        //_pageData = [[dateFormatter monthSymbols]copy];
        [self getDate];
        _pageData = [NSMutableArray arrayWithObjects:_gameData,_gameData,_gameData, nil]; 
        
    }
    return self;
}
-(void)getDate{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://test.appgz.com/Subscribe_json/list_Handler.ashx?type=ntype&id=1&page=1"]];  
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];  
    
    NSString *jsonStr = [[NSString alloc] initWithData:response encoding:  NSUTF8StringEncoding]; 
    
    NSObject * obj = [jsonStr JSONValue];
    _gameData = (NSDictionary *)obj;
    
    
}



-(AGZDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    AGZDataViewController *dataViewController = [[AGZDataViewController alloc]init]; //[storyboard instantiateViewControllerWithIdentifier:@"AGZDataViewController"];
    dataViewController.dataObject =[self.pageData objectAtIndex:index];
    
    
//   [self.titleData objectAtIndex:0];
    return dataViewController;
}

-(NSUInteger)indexOfViewController:(AGZDataViewController *)viewController{
 
    return [self.pageData indexOfObject:viewController.dataObject ];
   
} 

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSLog(@"%s",__FUNCTION__);
    NSUInteger index = [self indexOfViewController:(AGZDataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:nil];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSLog(@"%s",__FUNCTION__);
    NSUInteger index = [self indexOfViewController:(AGZDataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:nil];
}














@end
