//
//  HCollectionViewCell.swift
//  CustomViewFromXIB
//
//  Created by Rajesh Karmaker on 29/8/19.
//  Copyright © 2019 Rajesh Karmaker. All rights reserved.
//

import UIKit

class HCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
