//
//  InputTableViewCell.swift
//  FormTable
//
//  Created by Ronan Rodrigo Nunes on 10/15/15.
//  Copyright © 2015 meuspedidos. All rights reserved.
//

import UIKit

class InputTableViewCell: UITableViewCell {

    @IBOutlet weak var editText: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
