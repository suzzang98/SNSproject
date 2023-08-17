//
//  UserInfoRepository.swift
//  sssasdasd
//
//  Created by Woojun Lee on 2023/08/15.
//

import Foundation

class UserInfoRepository {
    
    var name: String = "june"
    var userName: String = ""
    var pronouns: String = ""
    var bio: String = ""
    var links: String = ""
    var gender: String = ""
    var postList: [Post] = []
    var follower: Int = 0
    var following: Int = 0
    
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




