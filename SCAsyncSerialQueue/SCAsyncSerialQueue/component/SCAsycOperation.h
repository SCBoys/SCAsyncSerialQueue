//
//  SCAsycOperation.h
//  SCAsyncSerialQueue
//
//  Created by TF14975 on 2018/1/29.
//  Copyright © 2018年 SC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SCSignal;
@interface SCAsycOperation : NSOperation

@property (nonatomic, strong) SCSignal *signal;
@property (nonatomic, copy) void(^operation)(SCSignal *signal);

@end
