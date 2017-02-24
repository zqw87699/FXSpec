//
//  TestViewController.m
//  FX
//
//  Created by 张大宗 on 2017/2/24.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "TestViewController.h"
#import "TestViewModel.h"
#import "ReactiveObjC.h"
#import "FXRoutable.h"
#import "FXURLAPI.h"

@interface TestViewController ()

@property (nonatomic,strong)TestViewModel *viewModel;

@end

@implementation TestViewController

- (NSArray*)fx_viewModels{
    return @[@"viewModel"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FX_WEAK_REF_TYPE selfObject = self;
    
    [RACObserve(self.viewModel, canObserve) subscribeNext:^(id  _Nullable x) {
        FXLogDebug(@"Observe:%@",x);
        if ([selfObject.viewModel canObserve]) {
            [[FXRoutable sharedInstance] setReturnRootNode:selfObject];
            [[FXRoutable sharedInstance] open:FX_URL_T animated:YES];
        }
    }];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [_viewModel request:^(BOOL success) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
