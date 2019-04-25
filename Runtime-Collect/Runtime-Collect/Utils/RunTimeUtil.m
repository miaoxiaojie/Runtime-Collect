//
//  RunTimeUtil.m
//  Runtime-Collect
//
//  Created by miao on 2019/3/28.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "RunTimeUtil.h"
#import <objc/runtime.h>
@import Foundation;

@implementation RunTimeUtil

/**
 * 运行时互换函数调用顺序, 实例方法
 */
static void transforInstanceMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    if (originalMethod != NULL && swizzledMethod != NULL)
    {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

/**
 * 运行时互换函数调用顺序, 类方法
 */
static void transforClassMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getClassMethod(class, originalSelector);
    Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
    
    if (originalMethod != NULL && swizzledMethod != NULL)
    {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


const struct RunTimeUtil runTimeUtil = {
    
    .transforInstanceMethod = transforInstanceMethod,
    .transforClassMethod = transforClassMethod
};


@end
