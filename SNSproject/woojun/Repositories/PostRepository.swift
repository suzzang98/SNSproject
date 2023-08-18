//
//  PostRepository.swift
//  SNSproject
//
//  Created by Woojun Lee on 2023/08/18.
//

import Foundation

class PostRepository {
    
    private var posts: [Post] = [Post(id: UUID().uuidString, photo: "samplePhoto1", content: "샘플 사진1 입니다.", uploadDate: Date()),
                         Post(id: UUID().uuidString, photo: "samplePhoto2", content: "샘플 사진2 입니다.", uploadDate: Date()),
                         Post(id: UUID().uuidString, photo: "samplePhoto3", content: "샘플 사진3 입니다.", uploadDate: Date()),
                         Post(id: UUID().uuidString, photo: "samplePhoto3", content: "샘플 사진3 입니다.", uploadDate: Date()),
                         Post(id: UUID().uuidString, photo: "samplePhoto3", content: "샘플 사진3 입니다.", uploadDate: Date()),
                         Post(id: UUID().uuidString, photo: "samplePhoto1", content: "샘플 사진1 입니다.", uploadDate: Date()),
                         Post(id: UUID().uuidString, photo: "samplePhoto2", content: "샘플 사진2 입니다.", uploadDate: Date()),
                         Post(id: UUID().uuidString, photo: "samplePhoto3", content: "샘플 사진3 입니다.", uploadDate: Date()),
                         Post(id: UUID().uuidString, photo: "samplePhoto3", content: "샘플 사진3 입니다.", uploadDate: Date()),
                         Post(id: UUID().uuidString, photo: "samplePhoto3", content: "샘플 사진3 입니다.", uploadDate: Date())
    ]
    
    static let shared = PostRepository()
    
    private init() {}
    
    func getAllPosts() -> [Post] {
        return posts
    }
    
    func addPost(post: Post) {
        posts.append(post)
    }
    
    func removePost(post: Post) {
        if let index = posts.firstIndex(of: post) {
            posts.remove(at: index)
        }
        
    }
}
