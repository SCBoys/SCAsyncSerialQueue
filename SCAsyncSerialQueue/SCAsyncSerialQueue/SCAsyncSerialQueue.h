//
//  SCAsyncSerialQueue.h
//  SCAsyncSerialQueue
//
//  Created by xiaofeishen on 2018/1/29.
//  Copyright © 2018年 SC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCSignal.h"

NS_ASSUME_NONNULL_BEGIN

@interface SCAsyncSerialQueue : NSObject

- (void)addOperation:(void(^)(SCSignal *signal))operation;

- (void)start;

@end
NS_ASSUME_NONNULL_END
