//
//  ViewController.m
//  SJNavigationController
//
//  Created by jocentzhou on 2017/11/17.
//  Copyright © 2017年 jocentzhou. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "UINavigationController+SJNavigationController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"First";
    
    self.btn.frame = CGRectMake(100, 100, 100, 44);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton  *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setTitle:@"test" forState:UIControlStateNormal];
        _btn.backgroundColor = [UIColor orangeColor];
        _btn.titleLabel.textColor = [UIColor whiteColor];
        [_btn addTarget:self action:@selector(tappedButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_btn];
    }
    
    return _btn;
}

- (void)tappedButtonAction:(UIButton *)button {
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end

