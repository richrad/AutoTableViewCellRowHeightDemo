//
//  MagicTableViewController.m
//  AutoTableViewCellRowHeightDemo
//
//  Created by Richard Allen on 9/22/14.
//  Copyright (c) 2014 Lapdog. All rights reserved.
//

#import "MagicTableViewController.h"
#import "MagicTableViewCell.h"

@interface MagicTableViewController ()

@property (strong, nonatomic) NSArray *data;

@end

@implementation MagicTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[MagicTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    NSString *aReallyLongString = @"This is a really long string that should take up at least a couple lines in a UILabel. It should be pretty long so it will help me see if this cell is resizing the way I want it to. That would be grand if it did.";
    
    NSString *aShorterString = @"This is a shorter string.";
    
    NSString *urlString = @"http://richardallen.me";
    
    NSString *manyTags = @"dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs";
    
    NSString *lessTags = @"dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs";
    
    _data = @[[[Bookmark alloc] initWithTitle:aReallyLongString  url:urlString tags:manyTags], [[Bookmark alloc] initWithTitle:aShorterString  url:urlString tags:lessTags]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MagicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Bookmark *bookmark = _data[indexPath.row];
    [cell populateWithBookmark:bookmark];
    
    return cell;
}

@end
