//
//  MagicSwiftTableViewController.swift
//  AutoTableViewCellRowHeightDemo
//
//  Created by Richard Allen on 9/24/14.
//  Copyright (c) 2014 Lapdog. All rights reserved.
//

import UIKit

class MagicSwiftTableViewController: UITableViewController {

    var data = [BookmarkSwift]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(MagicSwiftTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        let aReallyLongString = "This is a really long string that should take up at least a couple lines in a UILabel. It should be pretty long so it will help me see if this cell is resizing the way I want it to. That would be grand if it did."
        
        let aShorterString = "This is a shorter string."
        
        let urlString = "http://richardallen.me"
        
        let manyTags = "dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs"
        
        let lessTags = "dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs dogs"
        
        data = [BookmarkSwift(title: aReallyLongString, url: urlString, tags: manyTags), BookmarkSwift(title: aShorterString, url: urlString, tags: lessTags), BookmarkSwift(title: aReallyLongString, url: urlString, tags: manyTags), BookmarkSwift(title: aShorterString, url: urlString, tags: lessTags)]
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as MagicSwiftTableViewCell
        let bookmark = data[indexPath.row]
        cell.populateWithBookmark(bookmark)
        
        return cell
    }
    
    //MARK: -- A Not-Great Fix for UILabels Not Resizing When Rotated
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animateAlongsideTransition({ (context) -> Void in
            self.tableView.reloadRowsAtIndexPaths(self.tableView.indexPathsForVisibleRows()!, withRowAnimation: UITableViewRowAnimation.None)
        }, completion: { (context) -> Void in
            
        })
    }
}