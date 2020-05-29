//
//  UICollectionView+sort.swift
//  Tags
//
//  Created by Tatevik Tovmasyan on 5/26/20.
//  Copyright © 2020 Helix Consulting LLC. All rights reserved.
//

import Foundation
import UIKit

fileprivate class RowInformation {
    var spacing: CGFloat
    var cells: [UICollectionViewCell] = [] {
        didSet {
            width = cells.reduce(0.0, { $0 + $1.intrinsicContentSize.width })
            if !cells.isEmpty {
                width += CGFloat(cells.count - 1) * spacing
            }
        }
    }
    var width: CGFloat = 0.0
    
    init(spacing: CGFloat) {
        self.spacing = spacing
    }
}

extension UICollectionView {
    func getOptimalCells(_ cells: [UICollectionViewCell], maxWidth: CGFloat) -> [UICollectionViewCell] {
        var rows: [RowInformation] = []
        let spacing = (self.collectionViewLayout
            as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0.0
        
        var cellsCopy = cells
        cellsCopy.sort(by: { $0.intrinsicContentSize.width > $1.intrinsicContentSize.width })
        
        cellsCopy.forEach { (cell) in
            var isAdded: Bool = false
            for row in rows {
                if row.width + cell.intrinsicContentSize.width + spacing < maxWidth {
                    row.cells.append(cell)
                    isAdded = true
                    break
                }
            }
            if !isAdded {
                let newRow = RowInformation(spacing: spacing)
                newRow.cells.append(cell)
                rows.append(newRow)
            }
        }
        
        cellsCopy = rows.reduce(into: [UICollectionViewCell](), { (cells, row) in
            cells.append(contentsOf: row.cells)
        })
        
        return cellsCopy
    }
}
