//
//  FYFTableViewCell.m
//  FYFTableCollectionMiddleWare_Example
//
//  Created by kingstar on 2021/8/16.
//  Copyright © 2021 kingstar. All rights reserved.
//

#import "FYFTableViewCell.h"

#import "Masonry.h"
#import "FYFTableModel.h"

@interface FYFTableViewCell ()

@property (nonatomic, strong) UILabel *textlabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation FYFTableViewCell

@synthesize indexPath;
@dynamic model;
@synthesize table;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    _textlabel = [[UILabel alloc] init];
    self.textlabel.numberOfLines = 0;
    [self.contentView addSubview:self.textlabel];
    
    _timeLabel = [[UILabel alloc] init];

    self.timeLabel.text = @"2020-8-17:14:19:30";
    [self.contentView addSubview:self.timeLabel];
    
    [self.textlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.equalTo(self.timeLabel.mas_top).offset(-10);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textlabel.mas_bottom).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor =  [UIColor grayColor];
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
}

+ (CGFloat)heightForCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (void)setModel:(FYFTableModel *)model {    
    self.textlabel.text = model.text;
    self.timeLabel.text = [self currentDateStr];
}


- (NSString *)currentDateStr{
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];// 创建一个时间格式化对象
    [dateFormatter setDateFormat:@"YYYY/MM/dd hh:mm:ss "];//设定时间格式,这里可以设置成自己需要的格式
    NSString *dateString = [dateFormatter stringFromDate:currentDate];//将时间转化成字符串
    return dateString;
}

@end
