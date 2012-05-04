//
//  AGZAboveViewController.m
//  iPad_appgz
//
//  Created by appgz on 12-4-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AGZAboveViewController.h"
#import "JSON.h"
#import "AGZAbove.h"
#import "AGZHomeViewController.h"


#define game_url @"http://test.appgz.com/Subscribe_json/Type_Handler.ashx?type=gtype"
#define news_url @"http://test.appgz.com/Subscribe_json/Type_Handler.ashx?type=ntype"
#define company_url @"http://test.appgz.com/Subscribe_json/Type_Handler.ashx?type=companys"
@interface AGZAboveViewController ()

@end

@implementation AGZAboveViewController
@synthesize home;
@synthesize  arr;
-(void)dealloc{
    [arr release];
    [super dealloc];
}

-(void)setValue:(UITableViewCell * )cell{
    
    if ([cell.textLabel.text isEqualToString: @"游戏分类"]) {
        [self getValue:1];
}
    if([cell.textLabel.text isEqualToString:@"新闻分类"]){
        [self getValue:2];
}
    if([cell.textLabel.text isEqualToString:@"厂商分类"]){
        [self getValue:3]; 
}
    
}
-(void)getValue:(NSInteger ) number{
    NSString * str;
    switch (number) {
        case 1:
            str  = game_url;
            break;
            case 2:
            str = news_url;
            break;
            case 3:
            str = company_url;
        default:
            break;
    }
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];  
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];  
    
    NSString *jsonStr = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]; 
    
    arr = [jsonStr JSONValue];

    [arr retain];

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
       return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    return [arr count] ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell ) {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
    }
   
    // Configure the cell...
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15.0f];
   cell.textLabel.text = [[arr objectAtIndex:indexPath.row]valueForKey:@"Name"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"在这里呢%@",[tableView cellForRowAtIndexPath:indexPath] );
    [self.home moveAddButton:self.navigationController addName:nil];

   

}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 300, 395) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview: tableView];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
