//
//  MagicTableViewCell.m
//  AutoTableViewCellRowHeightDemo
//
//  Created by Richard Allen on 9/22/14.
//  Copyright (c) 2014 Lapdog. All rights reserved.
//

#import "MagicTableViewCell.h"

@interface MagicTableViewCell ()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *tagsLabel;
@property (strong, nonatomic) UILabel *urlLabel;

@end

@implementation MagicTableViewCell

+(BOOL)requiresConstraintBasedLayout
{
    return YES;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        _titleLabel.numberOfLines = 0;
        _titleLabel.backgroundColor = [UIColor colorWithRed:0.284 green:0.384 blue:0.677 alpha:1.000];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        _urlLabel = [[UILabel alloc] init];
        _urlLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        _urlLabel.numberOfLines = 1;
        _urlLabel.backgroundColor = [UIColor colorWithRed:0.940 green:0.654 blue:0.256 alpha:1.000];
        _urlLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        _tagsLabel = [[UILabel alloc] init];
        _tagsLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        _tagsLabel.numberOfLines = 0;
        _tagsLabel.backgroundColor = [UIColor colorWithRed:0.973 green:0.824 blue:0.239 alpha:1.000];
        _tagsLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.contentView addSubview:_titleLabel];
        [self.contentView addSubview:_urlLabel];
        [self.contentView addSubview:_tagsLabel];
    }
    
    return self;
}

-(void)updateConstraints
{
    NSMutableArray *constraints = [NSMutableArray new];
    NSDictionary *views = NSDictionaryOfVariableBindings(_titleLabel, _urlLabel, _tagsLabel);
    
	[constraints addObjectsFromArray:
	 [NSLayoutConstraint
	      constraintsWithVisualFormat:@"H:|-15-[_titleLabel]-15-|"
	                          options:0
	                          metrics:nil
	                            views:views]];

	[constraints addObjectsFromArray:
	 [NSLayoutConstraint
	      constraintsWithVisualFormat:@"H:|-15-[_urlLabel]-15-|"
	                          options:0
	                          metrics:nil
	                            views:views]];

	[constraints addObjectsFromArray:
	 [NSLayoutConstraint
	      constraintsWithVisualFormat:@"H:|-15-[_tagsLabel]-15-|"
	                          options:0
	                          metrics:nil
	                            views:views]];

	[constraints addObjectsFromArray:
	 [NSLayoutConstraint
          constraintsWithVisualFormat:@"V:|-[_titleLabel]-[_urlLabel]-[_tagsLabel]-|"
                              options:0
                              metrics:nil
                                views:views]];
    
    [self.contentView addConstraints:constraints];
    [super updateConstraints];
}

-(void)populateWithBookmark:(Bookmark *)bookmark
{
    _titleLabel.text = bookmark.title;
    _urlLabel.text = bookmark.url;
    _tagsLabel.text = bookmark.tags;
}

@end