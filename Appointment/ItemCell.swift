//
//  ItemCell.swift
//  Appointment
//
//  Created by Stringham on 10/22/18.
//  Copyright © 2018 Stringham. All rights reserved.
//

import UIKit
class ItemCell: UITableViewCell {
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        typeLabel.adjustsFontForContentSizeCategory = true
        dateLabel.adjustsFontForContentSizeCategory = true
        timeLabel.adjustsFontForContentSizeCategory = true
        locationLabel.adjustsFontForContentSizeCategory = true
        
        
    }
    
    
}
