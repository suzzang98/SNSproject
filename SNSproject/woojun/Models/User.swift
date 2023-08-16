//
//  User.swift
//  sssasdasd
//
//  Created by Woojun Lee on 2023/08/15.
//

import Foundation

struct User {
    
    var name: String
    var userName: String
    var pronouns: String = ""
    var bio: String = ""
    var links: String = ""
    var gender: String = ""
    var follower: Int = 0
    var following: Int = 0
    var postList: [Post] = []
}
