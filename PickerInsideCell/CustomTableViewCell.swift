//
//  CustomTableViewCell.swift
//  PickerInsideCell
//
//  Created by Sarath P on 16/08/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var showDateBtn: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    


    
}
