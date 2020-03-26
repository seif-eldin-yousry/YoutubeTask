//
//  ChannelTableViewCell.swift
//  Task
//
//  Created by Seif Yousry on 3/26/20.
//  Copyright © 2020 Seif Yousry. All rights reserved.
//

import UIKit

class ChannelTableViewCell: UITableViewCell {
    @IBOutlet weak var channelImage: UIImageView!
    @IBOutlet weak var channelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
