//
//  ReadImage.h
//  Weibo
//
//  Created by Historia Jee on 11-10-17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReadImage : NSObject

+ (UIImage*)readImageFromPath:(NSString*)filePath andImageUrl:(NSString*)imgUrl;
@end
