//
//  PurseViewController.m
//  QQSideBarDemo
//
//  Created by etmedia on 2017/7/5.
//  Copyright © 2017年 etmedia. All rights reserved.
//

#import "PurseViewController.h"
#import "NavigationBar.h"

@interface PurseViewController ()

@end

@implementation PurseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"QQ钱包";
    [NavigationBar setNavigationLeftButton:self.navigationItem withTarget:self andSelector:@selector(backEvent:)];
}

-(void)backEvent:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
