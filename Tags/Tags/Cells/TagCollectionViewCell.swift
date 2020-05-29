//
//  UICollectionView+sort.swift
//  Tags
//
//  Created by Tatevik Tovmasyan on 5/26/20.
//  Copyright © 2020 Helix Consulting LLC. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundVieww: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: self.titleLabel.intrinsicContentSize.width + 40.0, height: 45.0)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundVieww.layer.cornerRadius = 45/2
    }
    
    func config(info: String) {
        self.titleLabel.text = info
    }
}
