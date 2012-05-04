//
//  NetWork.m
//  Weibo
//
//  Created by Historia Jee on 11-10-13.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "NetWork.h"

@implementation NetWork

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    return self;
}

+ (BOOL)connectedToNetWork
{
    NSLog(@"%s",__FUNCTION__);
    struct sockaddr zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sa_len = sizeof(zeroAddress);
    zeroAddress.sa_family = AF_INET;
    
    SCNetworkReachabilityRef defaultRouteReachability =SCNetworkReachabilityCreateWithAddress(NULL, &zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability,&flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags) {
        NSLog(@"Could not recover network flags");
        return NO;
    }
    BOOL isReachable = flags & kSCNetworkFlagsReachable;
    BOOL needsConnection = flags & kSCNetworkFlagsInterventionRequired;
    return (isReachable && !needsConnection) ? YES:NO;
}
@end
