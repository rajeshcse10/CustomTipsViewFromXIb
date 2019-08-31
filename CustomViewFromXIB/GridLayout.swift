//
//  GridLayout.swift
//  CustomViewFromXIB
//
//  Created by Rajesh Karmaker on 31/8/19.
//  Copyright © 2019 Rajesh Karmaker. All rights reserved.
//

import UIKit

class GridLayout: UICollectionViewLayout {
    private var layoutMap = [IndexPath:UICollectionViewLayoutAttributes]()
    private var columnXoffset:[CGFloat]!
    private var contentSize:CGSize!
    
    private(set) var totalItemsInSection = 0
    private var itemSize:CGSize!
    
    var totalColumns = 0
    var interItemSpacing:CGFloat = 16
    
    var contentInset:UIEdgeInsets{
        return collectionView!.contentInset
    }
    
    override var collectionViewContentSize: CGSize{
        return contentSize
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        for(_,attribute) in layoutMap{
            if rect.intersects(attribute.frame){
                layoutAttributes.append(attribute)
            }
        }
        return layoutAttributes
    }
    
    func calculateItemsSize() {
        let contentHeightWithoutIndents = collectionView!.bounds.height - contentInset.top - contentInset.bottom
        let itemWidth:CGFloat = 109
        itemSize = CGSize(width: itemWidth, height: contentHeightWithoutIndents)
        
        // Calculating offsets by X for each column
        columnXoffset = []
        
        for columnIndex in 0...(totalColumns - 1) {
            columnXoffset.append(CGFloat(columnIndex) * (itemSize.width + interItemSpacing))
        }
    }
    
    // 2
    func calculateItemFrame(indexPath: IndexPath, columnIndex: Int, columnXoffset: CGFloat) -> CGRect {
        return CGRect.zero
    }
    
    
    override func prepare() {
        layoutMap.removeAll()
        totalItemsInSection = collectionView!.numberOfItems(inSection: 0)
        totalColumns = totalItemsInSection
        columnXoffset = Array(repeating: 0, count: totalColumns)
        
        
        if totalItemsInSection > 0{
            
            var itemIndex = 0
            var contentSizeWidth:CGFloat = 0
            calculateItemsSize()
            while itemIndex < totalItemsInSection{
                let indexPath = IndexPath(item: itemIndex, section: 0)
                //let columnIndex = columnIndexForItemAt(indexPath: indexPath)
                
                let attributeRect = CGRect(x: columnXoffset[itemIndex], y: collectionView!.frame.origin.y, width: itemSize.width, height: itemSize.height)
                let targetLayoutAttribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                targetLayoutAttribute.frame = attributeRect
                contentSizeWidth = max(attributeRect.maxX, contentSizeWidth)
                layoutMap[indexPath] = targetLayoutAttribute
                itemIndex += 1
            }
            contentSize = CGSize(width: contentSizeWidth, height: collectionView!.bounds.height - contentInset.top - contentInset.bottom)
        }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return layoutMap[indexPath]
    }
}
