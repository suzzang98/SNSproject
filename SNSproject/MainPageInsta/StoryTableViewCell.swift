//
//  StoryTableViewCell.swift
//  SNSproject
//
//  Created by t2023-m0088 on 2023/08/17.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    


    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var userStoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
        userProfileImg.layer.cornerRadius = userProfileImg.frame.height / 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
