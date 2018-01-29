//
//  SCAsyncSerialQueue.h
//  SCAsyncSerialQueue
//
//  Created by TF14975 on 2018/1/29.
//  Copyright © 2018年 SC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCSignal.h"

@interface SCAsyncSerialQueue : NSOperationQueue

+ (instancetype)queue;

- (void)addOperationOnMainThread:(void(^)(SCSignal *signal))operation;
 
@end
