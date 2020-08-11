//
//  TableViewCell.swift
//  Diffable Datasource sample
//
//  Created by Shanmugapriya on 19/07/20.
//  Copyright © 2020 Mallow Technologies. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
