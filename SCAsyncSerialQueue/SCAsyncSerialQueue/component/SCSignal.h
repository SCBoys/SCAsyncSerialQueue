//
//  SCSignal.h
//  SCAsyncSerialQueue
//
//  Created by TF14975 on 2018/1/29.
//  Copyright © 2018年 SC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SCSignalDelegate<NSObject>
- (void)scSignalNotificateOperationEnd;
@end
@interface SCSignal : NSObject

@property (nonatomic, weak, nullable) id<SCSignalDelegate> delgate;

- (void)end;

@end

NS_ASSUME_NONNULL_END
