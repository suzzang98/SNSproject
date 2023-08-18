//
//  MyPageCollectionReusableView.swift
//  SNSproject
//
//  Created by 이수현 on 2023/08/18.
//

import UIKit

// 뷰 간의 통신
protocol myPageCollectionReusableViewDelegate: AnyObject {
    func profileTapped()
    func postTapped()
    
}

class MyPageCollectionReusableView: UICollectionReusableView {
    
    weak var delegate: myPageCollectionReusableViewDelegate?
    // 사용자 이름, 프로필 사진, 유저 네임, 자기소개
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var myPageProfileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var bio: UITextView!
    
    // 게시물, 팔로워, 팔로잉 숫자
    @IBOutlet weak var postNum: UILabel!
    @IBOutlet weak var followNum: UILabel!
    @IBOutlet weak var followingNum: UILabel!
 
    // 셀 클릭하면 내 포스트 나열되어있는 화면으로 넘어가는 기능
    @IBAction func addPostTapped(_ sender: Any) {
        print("addPostTapped")
    }
    
    
    // 프로필 수정 버튼을 눌렀을 때 화면 전환
    @IBAction func editProfileTapped(_ sender: Any) {
        delegate?.profileTapped()

    }

}
