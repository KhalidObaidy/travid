//
//  VisitsRecordTableViewCell.swift
//  TRAVID
//
//  Created by MOHAMMED ALOBAIDY on 4/25/20.
//  Copyright © 2020 Khalid Alobaidi. All rights reserved.
//

import UIKit

class VisitsRecordTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var facilityNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var dateandtimeLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
