//
//  DmTableViewCell.swift
//  SNSproject
//
//  Created by t2023-m0088 on 2023/08/20.
//

import UIKit

class DmTableViewCell: UITableViewCell {

    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var userName2: UILabel!
    @IBOutlet weak var userContentLabel: UILabel!
    @IBOutlet weak var timeCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userProfileImg.layer.cornerRadius = userProfileImg.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
