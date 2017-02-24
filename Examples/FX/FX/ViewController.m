//
//  ViewController.m
//  FX
//
//  Created by 张大宗 on 2017/2/24.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "ViewController.h"
#import "FXRoutable.h"
#import "FXURLAPI.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[FXRoutable sharedInstance] open:FX_URL_TEST animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
