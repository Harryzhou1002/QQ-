//
//  MessageViewController.m
//  QQSideBarDemo
//
//  Created by etmedia on 2017/7/4.
//  Copyright © 2017年 etmedia. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"消息";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.userIMG];
    
}

-(UIImageView *)userIMG
{
    if (_userIMG == nil) {
        _userIMG = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon"]];
        _userIMG.frame = CGRectMake(0, 0, 35, 35);
        _userIMG.layer.masksToBounds = YES;
        _userIMG.layer.cornerRadius = 17.5;
    }
    return _userIMG;

}


@end
