//
//  DownLoadImage.h
//  Weibo
//
//  Created by Historia Jee on 11-10-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DownLoadDelegate;
@interface DownLoadImage : NSObject
{
    NSMutableData *_receiveData;
}
@property (nonatomic, retain) NSString *filePath;
@property (nonatomic, retain) NSString *imgUrl;
@property (nonatomic, assign) id<DownLoadDelegate> delegate;

- (id)initWithImgUrl:(NSString*)imgUrl andFilePath:(NSString*)filePath andDelegate:(id<DownLoadDelegate>)delegate;
- (void)begin;
@end

@protocol DownLoadDelegate <NSObject>
@optional
- (void)downLoading;
- (void)downLoadDidFinish;
- (void)downLoadWithError:(NSError*)error;

@end
