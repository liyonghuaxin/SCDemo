//
//  SubTableViewCell.m
//  SCDemo
//
//  Created by apple on 2018/1/18.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SubTableViewCell.h"

@implementation SubTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _imageV.contentMode = UIViewContentModeScaleToFill;
    self.selectionStyle = UITableViewCellAccessoryNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
