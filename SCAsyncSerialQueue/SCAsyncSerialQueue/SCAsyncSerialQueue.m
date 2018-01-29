//
//  SCAsyncSerialQueue.m
//  SCAsyncSerialQueue
//
//  Created by xiaofeishen on 2018/1/29.
//  Copyright © 2018年 SC. All rights reserved.
//

#import "SCAsyncSerialQueue.h"

//用来维护queue
static NSMutableDictionary *__asyncQueues;

@interface SCAsyncSerialQueue()<SCSignalDelegate>
@property (nonatomic, strong) NSMutableArray *operations;
@property (nonatomic, strong) SCSignal *signal;
@property (nonatomic, assign) NSInteger operateIndex;
@property (nonatomic, copy) NSString *uuid;
@end
@implementation SCAsyncSerialQueue

#pragma mark - init
+ (void)load {
    __asyncQueues = @{}.mutableCopy;
}

#pragma mark - life cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.operations = @[].mutableCopy;
        self.signal = [[SCSignal alloc] init];
        self.signal.delgate = self;
        self.operateIndex = -1;
    }
    return self;
}

#pragma mark - delegate
- (void)scSignalNotificateOperationEnd {
    [self beginNext];
}

#pragma mark - public method
- (void)addOperation:(void(^)(SCSignal *signal))operation {
    [self.operations addObject:operation];
}

- (void)start {
    self.uuid = [NSUUID UUID].UUIDString;
    [__asyncQueues setValue:self forKey:self.uuid];
    [self beginNext];
}

#pragma mark - pri method
- (void)beginNext {
    self.operateIndex++;
    if (self.operateIndex >= self.operations.count) {
        [self.operations removeAllObjects];
        self.operateIndex = -1;
        [__asyncQueues removeObjectForKey:self.uuid];
        return;
    }
    void(^opertation)(SCSignal *signal) = self.operations[self.operateIndex];
    opertation(self.signal);
}

@end
