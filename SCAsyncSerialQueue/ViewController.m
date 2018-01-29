//
//  ViewController.m
//  SCAsyncSerialQueue
//
//  Created by TF14975 on 2018/1/29.
//  Copyright © 2018年 SC. All rights reserved.
//

#import "ViewController.h"
#import "SCAsyncSerialQueue.h"
#import "SCAsyncSerialQueue.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    queue = [[SCAsyncSerialQueue alloc] init];
//    queue.maxConcurrentOperationCount = 1;
}

- (IBAction)addClick:(id)sender {
    SCAsyncSerialQueue *queue = [[SCAsyncSerialQueue alloc] init];
    [queue addOperation:^(SCSignal *signal) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(3);
            NSLog(@"1");
            [signal end];
        });
    }];
    [queue addOperation:^(SCSignal *signal) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(2);
            NSLog(@"2");
            [signal end];
        });
    }];
    [queue addOperation:^(SCSignal *signal) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(1);
            NSLog(@"3");
            [signal end];
        });
    }];
    [queue addOperation:^(SCSignal *signal) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(3);
            NSLog(@"4");
            [signal end];
        });
    }];
    [queue start];
    
//    [queue addOperationOnMainThread:^(SCSignal *signal) {
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            sleep(2);
//            NSLog(@"1");
//        });
//    }];
//    [queue addOperationOnMainThread:^(SCSignal *signal) {
//        NSLog(@"2");
//    }];
//    [queue addOperationOnMainThread:^(SCSignal *signal) {
//        NSLog(@"3");
//    }];
//    [queue addOperationOnMainThread:^(SCSignal *signal) {
//        NSLog(@"4");
//    }];
//    [queue addOperationOnMainThread:^(SCSignal *signal) {
//        NSLog(@"5");
//    }];
}

- (IBAction)end:(id)sender {
    SCAsyncSerialQueue *queue = [[SCAsyncSerialQueue alloc] init];
    [queue addOperation:^(SCSignal *signal) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(1);
            NSLog(@"end:5");
            [signal end];
        });
    }];
    [queue addOperation:^(SCSignal *signal) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(1);
            NSLog(@"nd:6");
            [signal end];
        });
    }];
    [queue addOperation:^(SCSignal *signal) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(1);
            NSLog(@"nd:7");
            [signal end];
        });
    }];
    [queue addOperation:^(SCSignal *signal) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(1);
            NSLog(@"nd:8");
            [signal end];
        });
    }];
    [queue start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
