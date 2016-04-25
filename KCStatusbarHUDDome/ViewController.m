//
//  ViewController.m
//  KCStatusbarHUDDome
//
//  Created by Kevin on 16/4/25.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "ViewController.h"
#import "KCStatusbarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)success {
    [KCStatusbarHUD showSuccuss:@"登录成功"];
}

- (IBAction)error {
    [KCStatusbarHUD showError:@"失败啦"];
}

- (IBAction)load {
    [KCStatusbarHUD showLoading:@"正在加载中"];
}

- (IBAction)hide {
    [KCStatusbarHUD hide];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
