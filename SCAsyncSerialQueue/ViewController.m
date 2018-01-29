//
//  ViewController.m
//  SCAsyncSerialQueue
//
//  Created by TF14975 on 2018/1/29.
//  Copyright © 2018年 SC. All rights reserved.
//

#import "ViewController.h"
#import "SCAsyncSerialQueue.h"

@interface ViewController ()
@property (nonatomic, strong) SCAsyncSerialQueue *queue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.queue = [[SCAsyncSerialQueue alloc] init];
    self.queue.maxConcurrentOperationCount = 1;
}

- (IBAction)addClick:(id)sender {
    [self.queue addOperationOnMainThread:^(SCSignal *signal) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            sleep(2);
            NSLog(@"1");
        });
    }];
    [self.queue addOperationOnMainThread:^(SCSignal *signal) {
        NSLog(@"2");
    }];
    [self.queue addOperationOnMainThread:^(SCSignal *signal) {
        NSLog(@"3");
    }];
    [self.queue addOperationOnMainThread:^(SCSignal *signal) {
        NSLog(@"4");
    }];
    [self.queue addOperationOnMainThread:^(SCSignal *signal) {
        NSLog(@"5");
    }];
}

- (IBAction)end:(id)sender {
    NSLog(@"end");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
