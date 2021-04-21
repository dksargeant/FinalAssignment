//
//  CellView.swift
//  Rocco_Bored
//
//  Created by Rocco Alexander on 2021-04-20.
//  033315151

import UIKit

class CellView: UITableViewCell {    
    @IBOutlet weak var activityLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
