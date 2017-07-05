//
//  BaseViewController.m
//  QQSideBarDemo
//
//  Created by etmedia on 2017/7/4.
//  Copyright © 2017年 etmedia. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self hidesBottomBarWhenPushed];

}

@end
