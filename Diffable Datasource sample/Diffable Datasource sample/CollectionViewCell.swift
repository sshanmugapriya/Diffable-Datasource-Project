//
//  CollectionViewCell.swift
//  Diffable Datasource sample
//
//  Created by Shanmugapriya on 11/08/20.
//  Copyright © 2020 Mallow Technologies. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
