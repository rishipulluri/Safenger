//
//  DataTableViewCell.swift
//  Safenger
//
//  Created by Sean Crenshaw on 11/19/16.
//  Copyright © 2016 Sean Crenshaw. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    @IBOutlet var ProfileImageView: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
