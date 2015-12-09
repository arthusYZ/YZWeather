//
//  CityDetailCell.m
//  YZWeather
//
//  Created by 杨舟 on 15/12/1.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "CityDetailCell.h"

@interface CityDetailCell ()

@property (nonatomic ,weak ) UIView *separator;

@end

@implementation CityDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIView *separator = [[UIView alloc] init];
        separator.backgroundColor = [UIColor blackColor];
        separator.alpha = 0.1f;
        [self.contentView addSubview:separator];
        self.separator = separator;
    }
    return self;
}

+ (CityDetailCell *)cellWithTableView:(UITableView *)tableview
{
    static NSString *ID = @"citydetail";
    CityDetailCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[CityDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.separator.frame = CGRectMake(0, 0, screenSize.width, 1);
}

@end
