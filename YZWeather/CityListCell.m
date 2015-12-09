//
//  CityListCell.m
//  YZWeather
//
//  Created by 杨舟 on 15/12/1.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "CityListCell.h"

@interface CityListCell ()

@property (nonatomic ,weak ) UIImageView *arrow;

@property (nonatomic ,weak ) UIView *separator;

@end

@implementation CityListCell

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
        UIImageView *arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Citylist_arrow"]];
        arrow.frame = CGRectMake(0, 0, 8, 12);
        [self.contentView addSubview:arrow];
        self.arrow = arrow;
        
        UIView *separator = [[UIView alloc] init];
        separator.backgroundColor = [UIColor blackColor];
        separator.alpha = 0.1f;
        [self.contentView addSubview:separator];
        self.separator = separator;
    }
    return self;
}

+ (CityListCell *)cellWithTableView:(UITableView *)tableview
{
    static NSString *ID = @"citylist";
    CityListCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[CityListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect cellFrame = self.frame;
    
    self.separator.frame = CGRectMake(0, 0, screenSize.width, 1);
    
    CGFloat arrowCenterX = screenSize.width - 12;
    CGFloat arrowCenterY = cellFrame.size.height * 0.5;
    self.arrow.center = CGPointMake(arrowCenterX, arrowCenterY);
}

@end
