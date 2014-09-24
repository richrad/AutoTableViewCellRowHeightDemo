//
//  MagicSwiftTableViewCell.swift
//  AutoTableViewCellRowHeightDemo
//
//  Created by Richard Allen on 9/23/14.
//  Copyright (c) 2014 Lapdog. All rights reserved.
//

import UIKit

class MagicSwiftTableViewCell: UITableViewCell {

    let titleLabel = UILabel()
    let tagsLabel = UILabel()
    let urlLabel = UILabel()
    
    override class func requiresConstraintBasedLayout() -> Bool {
        return true
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        titleLabel.numberOfLines = 0
        titleLabel.backgroundColor = UIColor(red: 0.284, green: 0.384, blue: 0.677, alpha: 1.000)
        titleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        urlLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        urlLabel.numberOfLines = 1
        urlLabel.backgroundColor = UIColor(red: 0.940, green: 0.654, blue: 0.256, alpha: 1.000)
        urlLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        tagsLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        tagsLabel.numberOfLines = 0
        tagsLabel.backgroundColor = UIColor(red: 0.973, green: 0.824, blue: 0.239, alpha: 1.000)
        tagsLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(urlLabel)
        contentView.addSubview(tagsLabel)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func updateConstraints() {
        let constraints = NSMutableArray()
        let views = ["titleLabel" : titleLabel,
                       "urlLabel" : urlLabel,
                      "tagsLabel" : tagsLabel]
        
        constraints.addObjectsFromArray(
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[titleLabel]-15-|",
                                                    options: NSLayoutFormatOptions(0),
                                                    metrics: nil,
                                                      views: views))
        constraints.addObjectsFromArray(
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[urlLabel]-15-|",
                                                    options: NSLayoutFormatOptions(0),
                                                    metrics: nil,
                                                      views: views))
        constraints.addObjectsFromArray(
            NSLayoutConstraint.constraintsWithVisualFormat("H:|-15-[tagsLabel]-15-|",
                                                    options: NSLayoutFormatOptions(0),
                                                    metrics: nil,
                                                      views: views))
        constraints.addObjectsFromArray(
            NSLayoutConstraint.constraintsWithVisualFormat("V:|-[titleLabel]-[urlLabel]-[tagsLabel]-|",
                                                    options: NSLayoutFormatOptions(0),
                                                    metrics: nil,
                                                      views: views))
        contentView.addConstraints(constraints)
        super.updateConstraints()
    }
    
    func populateWithBookmark(bookmark: BookmarkSwift) {
        titleLabel.text = bookmark.title
        urlLabel.text = bookmark.url
        tagsLabel.text = bookmark.tags
    }
}
