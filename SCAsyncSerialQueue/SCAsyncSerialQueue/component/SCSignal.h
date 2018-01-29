//
//  SCSignal.h
//  SCAsyncSerialQueue
//
//  Created by TF14975 on 2018/1/29.
//  Copyright © 2018年 SC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SCSignalDelegate<NSObject>
- (void)callback;
@end
@interface SCSignal : NSObject

@property (nonatomic, weak) id<SCSignalDelegate> delgate;

- (void)end;

@end
