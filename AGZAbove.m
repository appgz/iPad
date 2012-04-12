//
//  AGZAbove.m
//  iPad_appgz
//
//  Created by appgz on 12-3-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AGZAbove.h"
#import "JSON.h"

@implementation AGZAbove
@synthesize home;
//@synthesize next;
@synthesize agzController;

- (id)initWithFrame:(CGRect)frame
{
   self = [super initWithFrame:frame];
    if (self) {
      //  self.home.nav.view.hidden = NO;
        [self setBackgroundColor:[UIColor whiteColor]];
        self.layer.cornerRadius = 5;//设置弹出框为圆角视图
//        self.layer.masksToBounds = YES;
//        self.layer.borderWidth = 5; //设置弹出框视图的u边框宽度 
//        self.layer.borderColor = [[UIColor colorWithRed:0.40 green:0.10 blue:0.10 alpha:0.5]CGColor];//设置弹出框边框颜色
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button setFrame:CGRectMake(275, 0, 25, 25)];
//        [button setBackgroundColor:[UIColor redColor]];
//        [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];//此按钮用来关闭此试图
//        [button addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
//        button.tag =1;
       // [self addSubview:button];
        
        
//        navigation = [[UINavigationController alloc]init];
//        
//        navigation.view.frame = CGRectMake(0, 0, 300, 40);
//        
//        [self addSubview:navigation.view];
//        [navigation.view addSubview:button];

        
        //添加table
        UITableView * myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 300, 395) style:UITableViewStyleGrouped];
        myTableView.dataSource = self;
        myTableView.delegate = self;
        [self addSubview:myTableView];
       
        // Initialization code
        
/*        navigation = [[UINavigationController alloc]init];
    
        navigation.view.frame = CGRectMake(0, 0, 300, 40);

        [self addSubview:navigation.view];
        [navigation.view addSubview:button];
        
*/
        
        
        
            }
    array = [[NSArray alloc] initWithObjects:@"游戏分类",@"新闻分类",@"厂商分类",nil];
    return self;
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}




// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    [cell.textLabel setText:[array objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   AGZAboveViewController * next = [[AGZAboveViewController alloc]init];
    next.home = self.home;
 
    [self.agzController.navigationController pushViewController:next animated:YES];
   
    [next setValue:[tableView cellForRowAtIndexPath:indexPath]];
    [next release];
   
    
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
