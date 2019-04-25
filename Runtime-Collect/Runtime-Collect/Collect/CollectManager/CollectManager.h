//
//  CollectManager.h
//  Runtime-Collect
//
//  Created by miao on 2019/3/28.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectManager : NSObject

/**
 
自定义事件统计部分
 @param eventId 事件的id
 @param jsonStr 事件的内容
 向服务器发送事件的记录 将统计event_id对应事件发送次数，例如按钮的点击。
 */
+ (void)postEvent:(NSString *)eventId json:(NSString *)jsonStr;

/**
 在页面的viewWillAppear()方法调用该方法，该方法会记录下用户进入页面的时间
 */
+(void)startTracePage:(NSString*)pageName;

/**
 在页面的viewWillDisAppear()方法调用该方法，该方法会记录下用户退出页面
 */
+ (void)endTracPage:(NSString *)pageName;



@end

NS_ASSUME_NONNULL_END
