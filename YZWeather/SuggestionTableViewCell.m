//
//  SuggestionTableViewCell.m
//  YZWeather
//
//  Created by 杨舟 on 15/11/18.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "SuggestionTableViewCell.h"
#import "SuggestionView.h"
#import "ViewFrame.h"
#import "UIImage+YZ.h"

@interface SuggestionTableViewCell ()
/**
 *  生活标签
 */
@property (nonatomic ,weak ) UILabel *lifeLable;
/**
 *  水平方向分隔线
 */
@property (nonatomic ,weak ) UIView *horizontalDevider;
/**
 *  建议按钮数组
 */
@property (nonatomic ,strong ) NSMutableArray *suggestionBtnsArray;

@end

@implementation SuggestionTableViewCell

- (NSMutableArray *)suggestionBtnsArray
{
    if (!_suggestionBtnsArray) {
        _suggestionBtnsArray = [NSMutableArray array];
    }
    return _suggestionBtnsArray;
}

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
        UILabel *lifeLable = [[UILabel alloc] init];
        lifeLable.font = dailyDayfont;
        lifeLable.textColor = white;
        lifeLable.text = @"生活";
        [self addSubview:lifeLable];
        self.lifeLable = lifeLable;
        
        UIView *horizontalDevider = [[UIView alloc] init];
        horizontalDevider.backgroundColor = [UIColor lightGrayColor];
        horizontalDevider.alpha = deviderAlpha;
        [self addSubview:horizontalDevider];
        self.horizontalDevider = horizontalDevider;
        
        for (int i = 0; i < 7; i++) {
            SuggestionView *suggestionView = [[SuggestionView alloc] init];
            [self addSubview:suggestionView];
            [self.suggestionBtnsArray addObject:suggestionView];
        }
    }
    return self;
}

- (void)setSuggestionFrame:(SuggestionFrame *)suggestionFrame
{
    _suggestionFrame = suggestionFrame;
    
    self.lifeLable.frame = suggestionFrame.lifeLableFrame;
    
    self.horizontalDevider.frame = suggestionFrame.horizontalDeviderFrame;
    
    for (int i = 0; i < 7; i++) {
        ViewFrame *viewFrame = suggestionFrame.viewsFrameArray[i];
        SuggestionView *suggestionView = self.suggestionBtnsArray[i];
        suggestionView.image = [UIImage imageAtIndex:i];
        suggestionView.viewFrame = viewFrame;
        suggestionView.frame = viewFrame.viewFrame;
    }
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"suggestion";
    SuggestionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SuggestionTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

@end
