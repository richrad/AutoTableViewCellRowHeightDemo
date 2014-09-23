//
//  MagicTableViewCell.h
//  AutoTableViewCellRowHeightDemo
//
//  Created by Richard Allen on 9/22/14.
//  Copyright (c) 2014 Lapdog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bookmark.h"

@interface MagicTableViewCell : UITableViewCell

-(void)populateWithBookmark:(Bookmark *)bookmark;

@end