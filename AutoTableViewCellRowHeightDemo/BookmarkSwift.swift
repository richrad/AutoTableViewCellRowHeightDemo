//
//  BookmarkSwift.swift
//  AutoTableViewCellRowHeightDemo
//
//  Created by Richard Allen on 9/24/14.
//  Copyright (c) 2014 Lapdog. All rights reserved.
//

class BookmarkSwift {
    var title: String
    var url: String
    var tags: String
    
    init(title titleString: String, url urlString: String, tags tagsString: String) {
        title = titleString
        url = urlString
        tags = tagsString
    }
}