//
//  CollectManager.m
//  Runtime-Collect
//
//  Created by miao on 2019/3/28.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "CollectManager.h"

@implementation CollectManager

+(void)startTracePage:(NSString*)pageName
{
    //调用友盟的统计
   //    [UMSAgent startTracePage:pageName];
    NSLog(@"***模拟发送[进入页面]事件给服务端，页面ID:%@", pageName);
}

+ (void)endTracPage:(NSString *)pageName
{
    //调用友盟的统计
    //[UMSAgent endTracePage:pageName];
    NSLog(@"***模拟发送[退出页面]事件给服务端，页面ID:%@", pageName);
}

+ (void)postEvent:(NSString *)eventId json:(NSString *)jsonStr
{   //调用友盟的统计
    //[UMSAgent postEventJSON:event_id json:jsonStr];
     NSLog(@"***模拟发送统计事件给服务端，事件ID: %@==%@", eventId,jsonStr);
}

@end
