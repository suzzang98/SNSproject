//
//  PostRepository.swift
//  SNSproject
//
//  Created by Woojun Lee on 2023/08/18.
//

import Foundation
import UIKit

class PostRepository {
    
    private var posts: [Post] = [Post(id: UUID().uuidString, userProfileImage: UIImage(named:"samplePhoto1")!, contentImage: UIImage(named: "post_4")!, content: "샘플 사진1 입니다.", uploadDate: Date()),
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
    
    static let shared = PostRepository()
    
    private init() {}
    
    func getAllPosts() -> [Post] {
        return posts
    }
    
    func addPost(post: Post) {
        posts.insert(post, at: 0)
    }
    
    func removePost(post: Post) {
        if let index = posts.firstIndex(of: post) {
            posts.remove(at: index)
        }
        
    }
}
