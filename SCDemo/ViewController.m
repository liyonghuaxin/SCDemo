//
//  ViewController.m
//  SCDemo
//
//  Created by apple on 2018/1/18.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "YYFPSLabel.h"
#import "TableViewCell.h"

#define WIDTH  self.view.bounds.size.width
#define HEIGHT self.view.bounds.size.width


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    YYFPSLabel *_fpsLabel;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //检测页面流畅度
    _fpsLabel = [YYFPSLabel new];
    _fpsLabel.frame = CGRectMake(100, 10, 50, 30);
    [_fpsLabel sizeToFit];
    [self.view addSubview:_fpsLabel];
    
    [_myTableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    //从复用池拿出来的cell中的tableview可能之前滑动使contentOffset不是(0, 0)
    cell.myTableView.contentOffset = CGPointMake(0, 0);
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
