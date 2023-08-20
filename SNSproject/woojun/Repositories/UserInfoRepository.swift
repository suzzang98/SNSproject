//
//  UserInfoRepository.swift
//  sssasdasd
//
//  Created by Woojun Lee on 2023/08/15.
//

import Foundation
import UIKit

class UserInfoRepository {
    
//    var sampleUser = User(name: "suzzang_g", userName: "이수현", bio:"안녕하세요 이수현의 계정입니다.", follower: 450, following: 200, postList: myPost)
    
    var name: String = "suzzang_g"
    var userName: String = "이수현"
    var pronouns: String = ""
    var bio: String = "안녕하세요 이수현의 계정입니다."
    var links: String = ""
    var gender: String = ""
    var profilePhoto: UIImage = UIImage(named: "default_profile")!
    var postList: [Post] = [Post(id: UUID().uuidString, userProfileImage: UIImage(named:"samplePhoto1")!, contentImage: UIImage(named: "post_4")!, content: "샘플 사진1 입니다.", uploadDate: Date()),
                            Post(id: UUID().uuidString, userProfileImage: UIImage(named:"samplePhoto2")!, contentImage: UIImage(named: "post_4")!, content: "샘플 사진2 입니다.", uploadDate: Date()),
                            Post(id: UUID().uuidString, userProfileImage: UIImage(named:"samplePhoto3")!, contentImage: UIImage(named: "post_4")!, content: "샘플 사진3 입니다.", uploadDate: Date()),
                            Post(id: UUID().uuidString, userProfileImage: UIImage(named:"samplePhoto3")!, contentImage: UIImage(named: "post_4")!, content: "샘플 사진3 입니다.", uploadDate: Date()),
                            Post(id: UUID().uuidString, userProfileImage: UIImage(named:"samplePhoto3")!, contentImage: UIImage(named: "post_4")!, content: "샘플 사진3 입니다.", uploadDate: Date()),
                            Post(id: UUID().uuidString, userProfileImage: UIImage(named:"samplePhoto1")!, contentImage: UIImage(named: "post_4")!, content: "샘플 사진1 입니다.", uploadDate: Date()),
                            Post(id: UUID().uuidString, userProfileImage: UIImage(named:"samplePhoto2")!, contentImage: UIImage(named: "post_4")!, content: "샘플 사진2 입니다.", uploadDate: Date()),
                            Post(id: UUID().uuidString, userProfileImage: UIImage(named:"samplePhoto3")!, contentImage: UIImage(named: "post_4")!, content: "샘플 사진3 입니다.", uploadDate: Date()),
                            Post(id: UUID().uuidString, userProfileImage: UIImage(named:"samplePhoto3")!, contentImage: UIImage(named: "post_4")!, content: "샘플 사진3 입니다.", uploadDate: Date()),
                            Post(id: UUID().uuidString, userProfileImage: UIImage(named:"samplePhoto3")!, contentImage: UIImage(named: "post_4")!, content: "샘플 사진3 입니다.", uploadDate: Date())
    ]
    var follower: Int = 450
    var following: Int = 200
    
    static let shared = UserInfoRepository()
    
    private init() { }
    
    
    
    //    init(user: User) {
    //        self.name = user.name
    //        self.userName = user.userName
    //        self.pronouns = user.pronouns
    //        self.bio = user.pronouns
    //        self.links = user.links
    //        self.gender = user.gender
    //    }
}




