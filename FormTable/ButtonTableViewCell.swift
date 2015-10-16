//
//  LabelTableViewCell.swift
//  FormTable
//
//  Created by Ronan Rodrigo Nunes on 10/16/15.
//  Copyright © 2015 meuspedidos. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var actionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
