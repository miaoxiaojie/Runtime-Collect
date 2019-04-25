//
//  UIControl+Collect.m
//  Runtime-Collect
//
//  Created by miao on 2019/3/28.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "UIControl+Collect.h"
#import "CollectManager.h"
#import "runTimeUtil.h"
#import "DetailViewController.h"

@implementation UIControl (Collect)


#pragma mark - Method Swizzling

- (void)transfor_sendAction:(SEL)action
                         to:(id)target
                   forEvent:(UIControlEvents)event
                    eventId:(NSString *)eventId
                       json:(NSString *)jsonStr

{
    //插入埋点代码
    [self transfor_sendAction:action to:target forEvent:event eventId:eventId json:jsonStr];
    [CollectManager postEvent:eventId json:jsonStr];
    
    
}

+ (void)load
{
    //上传客户唯一标识
    runTimeUtil.transforInstanceMethod([self class],
                                            @selector(collectWithEventId:
                                                      json:),
                                        @selector(transfor_sendAction:to:forEvent:eventId:json:));
    
    
}



@end
