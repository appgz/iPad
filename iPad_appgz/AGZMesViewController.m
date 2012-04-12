//
//  AGZMesViewController.m
//  iPad_appgz
//
//  Created by appgz on 12-4-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AGZMesViewController.h"
#import "AGZTextViewController.h"
#import "AGZViewToImage.h"
#import "Utilities.h"

@interface AGZMesViewController ()

@end

@implementation AGZMesViewController

- (id)init {
    if (self = [super init]) {
		AGZTextViewController * tex = [[AGZTextViewController alloc]init];
        images = [[NSArray alloc]initWithObjects:[AGZViewToImage imageFromeView:tex.view],
                                                [UIImage imageNamed:@"1-15.jpg"],
                                                [UIImage imageNamed:@"1-14.jpg"],
                                                [UIImage imageNamed:@"1-11.jpg"],
                                                nil];
        [tex release];
    }
    return self;
}

- (void)dealloc {
    
	[images release];
    [super dealloc];
}


- (NSUInteger) numberOfPagesInLeavesView:(LeavesView*)leavesView {
	return images.count;
}
-(void)renderPageAtIndex:(NSUInteger)index inContext:(CGContextRef)ctx {
	UIImage *image = [images objectAtIndex:index];
	CGRect imageRect = CGRectMake(0, 0, 768,1024);//image.size.width, image.size.height);
	//CGAffineTransform transform = aspectFit(imageRect,
	//										CGContextGetClipBoundingBox(ctx));
	//CGContextConcatCTM(ctx, transform);
	CGContextDrawImage(ctx, imageRect, [image CGImage]);
    
}


/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
       
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
