//
//  User.swift
//  SNSproject
//
//  Created by 이수현 on 2023/08/15.
//

import Foundation

struct User {
    // 유저 하나에 들어있어야하는 요소
    var profilePhoto: String = "default_profile"
    var name: String
    var userName: String
    var bio: String = ""
    var postList: [Post] = []
    var follower: Int = 0
    var following: Int = 0
}
