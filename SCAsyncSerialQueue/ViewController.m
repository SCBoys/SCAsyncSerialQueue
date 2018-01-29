//
//  ViewController.m
//  SCAsyncSerialQueue
//
//  Created by TF14975 on 2018/1/29.
//  Copyright © 2018年 SC. All rights reserved.
//

#import "ViewController.h"
#import "SCAsyncSerialQueue.h"
#import "TestQueue.h"

@interface ViewController ()
//@property (nonatomic, strong) SCAsyncSerialQueue *queue;
@property (nonatomic, strong) TestQueue *queue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.queue = [TestQueue queue];
//    self.queue = [[SCAsyncSerialQueue alloc] init];
//    self.queue.maxConcurrentOperationCount = 1;
}

- (IBAction)addClick:(id)sender {
    [self.queue addOperation:^(SCSignal *signal) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(3);
            NSLog(@"1");
            [signal end];
        });
    }];
    [self.queue addOperation:^(SCSignal *signal) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(2);
            NSLog(@"2");
            [signal end];
        });
    }];
    [self.queue addOperation:^(SCSignal *signal) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(1);
            NSLog(@"3");
            [signal end];
        });
    }];
    [self.queue addOperation:^(SCSignal *signal) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(3);
            NSLog(@"4");
            [signal end];
        });
    }];
    [self.queue start];
    
//    [self.queue addOperationOnMainThread:^(SCSignal *signal) {
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            sleep(2);
//            NSLog(@"1");
//        });
//    }];
//    [self.queue addOperationOnMainThread:^(SCSignal *signal) {
//        NSLog(@"2");
//    }];
//    [self.queue addOperationOnMainThread:^(SCSignal *signal) {
//        NSLog(@"3");
//    }];
//    [self.queue addOperationOnMainThread:^(SCSignal *signal) {
//        NSLog(@"4");
//    }];
//    [self.queue addOperationOnMainThread:^(SCSignal *signal) {
//        NSLog(@"5");
//    }];
}

- (IBAction)end:(id)sender {
    NSLog(@"end");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
