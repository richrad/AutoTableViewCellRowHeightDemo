//
//  Bookmark.m
//  AutoTableViewCellRowHeightDemo
//
//  Created by Richard Allen on 9/22/14.
//  Copyright (c) 2014 Lapdog. All rights reserved.
//

#import "Bookmark.h"

@implementation Bookmark

-(instancetype)initWithTitle:(NSString *)titleString  url:(NSString *)urlString tags:(NSString *)tagsString;
{
    self = [super init];
    if (self) {
        _title = titleString;
        _url = urlString;
        _tags = tagsString;
    }
    
    return self;
}

@end