//
//  PostTableViewCell.swift
//  instagram
//
//  Created by t2023-m0088 on 2023/08/14.
//

import UIKit


protocol PostCellDelegate {
    func likeButtonTapped(index: Int)
    func nameLabelTapped()
}



class PostTableViewCell: UITableViewCell {
//tableview안에 셀이있을때 어떻게해야하는지
//ios button in tableviewcell
    
    var index: Int = 0
    var delegate:PostCellDelegate?
    
    var UnLike = true
    var Like = false
    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var likesLabel: UILabel!
    @IBOutlet var posting: UILabel!
    @IBOutlet weak var likesChange: UIImageView!
    
    @IBAction func pushLike(_ sender: UIButton) {

        self.delegate?.likeButtonTapped(index: self.index)
//        delegate 패턴
//        위임을 주는사람 postTableviewcell
         likesChange.isHidden = UnLike
        
    }
    
    static let identifier = "PostTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "PostTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with model: Post,index:Int){
        self.index = index
        self.likesLabel.text = "\(model.numberOfLikes) Likes"
        self.usernameLabel.text = "asdas"
        self.userImageView.image = model.userProfileImage
        self.postImageView.image = model.contentImage
        self.posting.text = model.content
        addGestureOnUserNameLabel()
    }
    
    @objc private func userNameLabelTapped(_ sender: UITapGestureRecognizer) {
        delegate?.nameLabelTapped()

        
    }
    
    private func addGestureOnUserNameLabel() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(userNameLabelTapped(_:)))
        usernameLabel.addGestureRecognizer(gesture)
        usernameLabel.isUserInteractionEnabled = true
    }
    
    
}
