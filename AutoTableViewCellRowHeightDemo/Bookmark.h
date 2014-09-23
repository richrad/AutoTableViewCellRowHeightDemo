//
//  Bookmark.h
//  AutoTableViewCellRowHeightDemo
//
//  Created by Richard Allen on 9/22/14.
//  Copyright (c) 2014 Lapdog. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bookmark : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *tags;

-(instancetype)initWithTitle:(NSString *)titleString  url:(NSString *)url tags:(NSString *)tagsString;

@end