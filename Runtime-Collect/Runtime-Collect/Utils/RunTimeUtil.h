//
//  RunTimeUtil.h
//  Runtime-Collect
//
//  Created by miao on 2019/3/28.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RunTimeUtil : NSObject


extern const struct RunTimeUtil
{
    void (*transforInstanceMethod)(Class, SEL, SEL);
    
    void (*transforClassMethod)(Class, SEL, SEL);
    
}runTimeUtil;


@end

NS_ASSUME_NONNULL_END
