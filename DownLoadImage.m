//
//  DownLoadImage.m
//  Weibo
//
//  Created by Historia Jee on 11-10-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "DownLoadImage.h"

@implementation DownLoadImage
@synthesize filePath = _filePath, imgUrl = _imgUrl, delegate = _delegate;
- (id)initWithImgUrl:(NSString*)imgUrl andFilePath:(NSString*)filePath andDelegate:(id<DownLoadDelegate>)delegate
{
    self = [super init];
    if (self) {
        self.filePath = filePath;
        self.imgUrl = imgUrl;
        self.delegate = delegate;
    }
    return self;
}
- (void)begin
{
    NSURL *imgUrl = [NSURL URLWithString:self.imgUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:imgUrl];
    [NSURLConnection connectionWithRequest:request delegate:self];
}
#pragma mark connection delegate
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%s",__FUNCTION__);
    if ([_delegate respondsToSelector:@selector(downLoadWithError:)]) {
        [_delegate downLoadWithError:error];
    }
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"%s",__FUNCTION__);
    _receiveData = [[NSMutableData alloc] init];
    if ([_delegate respondsToSelector:@selector(downLoading)]) {
        [_delegate downLoading];
    }
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_receiveData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"%s",__FUNCTION__);
    NSString *fileName = [self.imgUrl stringByReplacingOccurrencesOfString:@"/" withString:@"%4f"];
    fileName = [fileName stringByReplacingOccurrencesOfString:@"http:" withString:@"%2f"];
    fileName = [fileName stringByReplacingOccurrencesOfString:@"tp2.sinaimg.cn" withString:@"%3f"];
    self.filePath=[self.filePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",fileName]];
   // NSLog(@"%@",self.filePath);
    [_receiveData writeToFile:self.filePath atomically:YES];
    if ([_delegate respondsToSelector:@selector(downLoadDidFinish)]) {
        [_delegate downLoadDidFinish];
    }
}


- (void)dealloc
{
    [_filePath release];
    [_imgUrl release];
    [_delegate release];
    [super dealloc];
}
@end
