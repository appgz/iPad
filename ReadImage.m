//
//  ReadImage.m
//  Weibo
//
//  Created by Historia Jee on 11-10-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ReadImage.h"

@implementation ReadImage

+ (UIImage*)readImageFromPath:(NSString *)filePath andImageUrl:(NSString *)imgUrl
{
    
    
    NSString *_filePath = filePath;
    NSString *fileName = [imgUrl stringByReplacingOccurrencesOfString:@"/" withString:@"%4f"];
    fileName = [fileName stringByReplacingOccurrencesOfString:@"http:" withString:@"%2f"];
    fileName = [fileName stringByReplacingOccurrencesOfString:@"tp2.sinaimg.cn" withString:@"%3f"];
    _filePath=[filePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",fileName]];
    UIImage *img = [UIImage imageWithContentsOfFile:_filePath];
    return img;
}

@end
