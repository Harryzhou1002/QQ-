//
//  SideMenuViewController.m
//  QQSideBarDemo
//
//  Created by etmedia on 2017/7/4.
//  Copyright © 2017年 etmedia. All rights reserved.
//

#import "SideMenuViewController.h"

@interface SideMenuViewController ()<SideMenuViewControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray * dataArr;

@property (strong, nonatomic) UITableView * tableView;



@end

@implementation SideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.hidden = NO;
    self.view.backgroundColor = [UIColor clearColor];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:17];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   if(_delegate && [_delegate respondsToSelector:@selector(sideMenuViewController:clickMenuItem:)])
   {
       [_delegate sideMenuViewController:self clickMenuItem:self.dataArr[indexPath.row]];
   
   }
       
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}


-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.frame = CGRectMake(0, 160, self.view.bounds.size.width*0.7, self.view.bounds.size.height - 320);
        _tableView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(NSMutableArray *)dataArr
{
    if (_dataArr == nil) {
        _dataArr = [[NSMutableArray alloc]initWithObjects:@"开通会员",@"QQ钱包",@"网上营业厅",@"个性装扮",@"我的收藏",@"我的相册",@"我的文件", nil];
    }
    return _dataArr;
}

@end
