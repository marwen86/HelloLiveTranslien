//
//  TrainDataTableViewCell.swift
//  LiveTrain2.0
//
//  Created by Mohamed Marouane YOUSSEF on 12/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

import UIKit

class TrainDataTableViewCell: UITableViewCell {

    @IBOutlet weak var trainName: UILabel!
    @IBOutlet weak var trainTerminus: UILabel!
    @IBOutlet weak var trainDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
