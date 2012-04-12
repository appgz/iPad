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
    NSLog(@"%@",cell.textLabel.text);
    if ([cell.textLabel.text isEqualToString: @"游戏分类"]) {
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://test.appgz.com/Subscribe_json/Type_Handler.ashx?type=gtype"]];  
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];  
        
        NSString *jsonStr = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]; 
        
        
        arr = [jsonStr JSONValue];
        NSLog(@"数组里内容：%@",[arr description] );
        
        for (int i=0; i<[arr count]; i++) {
        //    NSLog(@"%@",[[arr objectAtIndex:i]valueForKey:@"Name"]);
            NSLog(@"%@",[arr valueForKey:@"Name"]);
            
        } 
        [arr retain];
}
    if([cell.textLabel.text isEqualToString:@"新闻分类"]){
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://test.appgz.com/Subscribe_json/Type_Handler.ashx?type=ntype"]];  
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];  
        
        NSString *jsonStr = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]; 
        
        
        arr = [jsonStr JSONValue];
        for (int i=0; i<[arr count]; i++) {
            NSLog(@"%@",[[arr objectAtIndex:i]valueForKey:@"Name"]);
            
        }
        [arr retain ];
    }
    
    
    if([cell.textLabel.text isEqualToString:@"厂商分类"]){
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://test.appgz.com/Subscribe_json/Type_Handler.ashx?type=companys"]];  
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];  
        
        NSString *jsonStr = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding]; 
        
        
        arr = [jsonStr JSONValue];
        for (int i=0; i<[arr count]; i++) {
            
            NSLog(@"%@",[[arr objectAtIndex:i]valueForKey:@"Name"]);
            
        }
        [arr retain ];

    }
    
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
   
    //[[arr objectAtIndex:indexPath.row]valueForKey:@"name"]);
    
    // Configure the cell...
   cell.textLabel.text = [[arr objectAtIndex:indexPath.row]valueForKey:@"Name"];

    
        //  [[arr objectAtIndex:indexPath.row]valueForKey:@"name"];

//    NSLog(@"cell li %d",[arr retainCount]);
    
    
      //   [cell.textLabel setText:[[arr objectAtIndex:indexPath.row]valueForKey:@"name"]];
    //  cell.textLabel.text= [[arr objectAtIndex:indexPath] objectForKey:@"name"];
    //[[arr objectatindex:indexPath.row]valueForKey:@"name"];
    
    
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
  //  nav.view.hidden = YES;
//   AGZHomeViewController * home = [[AGZHomeViewController alloc]init];
    [self.home moveAddButton:self.navigationController addName:@"新添加的名称"];
    //home.nav.view.hidden = YES;
    NSLog(@"wwwwwwwwwwwwwwww");
//    [home release];
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
