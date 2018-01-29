//
//  SCAsyncSerialQueue.m
//  SCAsyncSerialQueue
//
//  Created by TF14975 on 2018/1/29.
//  Copyright © 2018年 SC. All rights reserved.
//

#import "SCAsyncSerialQueue.h"
#import "SCAsycOperation.h"

@interface SCAsyncSerialQueue()

@end
@implementation SCAsyncSerialQueue

- (void)addOperationOnMainThread:(void(^)(SCSignal *signal))operation {
    SCAsycOperation *asyOperation = [[SCAsycOperation alloc] init];
    asyOperation.operation = operation;
    [self addOperation:asyOperation];
}

@end
