//
//  AGZArticleView.m
//  iPad_appgz
//
//  Created by appgz on 12-4-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AGZArticleView.h"

@implementation AGZArticleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setBackgroundColor:[UIColor whiteColor]];
        self.layer.cornerRadius = 5;//设置弹出框为圆角视图
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 5; //设置弹出框视图的u边框宽度 
        self.layer.borderColor = [[UIColor colorWithRed:0.40 green:0.10 blue:0.10 alpha:0.5]CGColor];//设置弹出框边框颜色
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(self.frame.origin.x-30, self.frame.origin.y-30, 25, 25)];
        [button setBackgroundColor:[UIColor redColor]];
        [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];//此按钮用来关闭此试图
        [button addTarget:self action:@selector(onClickButton) forControlEvents:UIControlEventTouchUpInside];
        button.tag =1;
         [self addSubview:button];
        
        
        UIActivityIndicatorView * avt = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(100, 100, 24, 24)];
        [avt setColor:[UIColor redColor]];
        [self addSubview:avt];
        [avt startAnimating];
        [avt release];


    }
    return self;
}
-(void)onClickButton{
    self.hidden = YES;
    NSLog(@"ok");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
