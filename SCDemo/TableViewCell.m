//
//  TableViewCell.m
//  SCDemo
//
//  Created by apple on 2018/1/18.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TableViewCell.h"
#import "SubTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface TableViewCell ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //tableview的宽是本cell在ViewController中的高度
    //tableview的高是屏幕的宽
    _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, [UIScreen mainScreen].bounds.size.width) style:UITableViewStylePlain];
    //这里的50是cell的高度的一半
    _myTableView.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, 50);
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    //tableview逆时针旋转90度
    CGAffineTransform transform = CGAffineTransformMakeRotation(-M_PI/2);
    _myTableView.transform=transform;
    _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _myTableView.showsVerticalScrollIndicator = NO;
    [self.contentView addSubview:_myTableView];
    [_myTableView registerNib:[UINib nibWithNibName:@"SubTableViewCell" bundle:nil] forCellReuseIdentifier:@"SubTableViewCell"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //返回SubTableViewCell的宽度
    return 110;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubTableViewCell"];
    [cell.imageV sd_setImageWithURL:[NSURL URLWithString:@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=12867320,655225767&fm=27&gp=0.jpg"]];
    //cell顺时针旋转90度
    CGAffineTransform tran=CGAffineTransformMakeRotation(M_PI/2);
    cell.transform=tran;
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
