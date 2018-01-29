//
//  SCSignal.m
//  SCAsyncSerialQueue
//
//  Created by TF14975 on 2018/1/29.
//  Copyright © 2018年 SC. All rights reserved.
//

#import "SCSignal.h"

@implementation SCSignal

- (void)end {
    [self.delgate callback];
}

@end
