//
//  UIViewController+Collect.m
//  Runtime-Collect
//
//  Created by miao on 2019/3/28.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "UIViewController+Collect.h"
#import "RunTimeUtil.h"
#import "CollectManager.h"

@implementation UIViewController (Collect)

#pragma mark - Method Swizzling

-(void)transfor_viewWillAppear:(BOOL)animated
{
    //插入需要统计的代码
    [self transfor_viewWillAppear:YES];
    [CollectManager startTracePage:NSStringFromClass([self class])];
}

-(void)transfor_viewWillDisappear:(BOOL)animated
{
    [self transfor_viewWillDisappear:YES];
    [CollectManager endTracPage:NSStringFromClass([self class])];
}

+ (void)load
{
    //上传客户唯一标识
    runTimeUtil.transforInstanceMethod([self class],
                                            @selector(viewWillAppear:),
                                            @selector(transfor_viewWillAppear:));
    runTimeUtil.transforInstanceMethod([self class],
                                            @selector(viewWillDisappear:),
                                            @selector(transfor_viewWillDisappear:));
    
}


@end
