//
//  SamplePost.swift
//  SNSproject
//
//  Created by 이수현 on 2023/08/15.
//

import Foundation

var myPost: [Post] = [
    Post(id: 0, photo: "samplePhoto1", content: "샘플 사진1 입니다.", uploadDate: Date()),
    Post(id: 1, photo: "samplePhoto2", content: "샘플 사진2 입니다.", uploadDate: Date()),
    Post(id: 2, photo: "samplePhoto3", content: "샘플 사진3 입니다.", uploadDate: Date()),
    Post(id: 2, photo: "samplePhoto3", content: "샘플 사진3 입니다.", uploadDate: Date()),
    Post(id: 2, photo: "samplePhoto3", content: "샘플 사진3 입니다.", uploadDate: Date())
]


var sampleUser = User(name: "suzzang_g", userName: "이수현", bio:"안녕하세요 이수현의 계정입니다.", follower: 450, following: 200, postList: myPost)
