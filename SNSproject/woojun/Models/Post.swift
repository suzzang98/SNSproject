//
//  Post.swift
//  sssasdasd
//
//  Created by Woojun Lee on 2023/08/16.
//

import Foundation
import UIKit

struct Post: Equatable {
    
    var id: String // uuid
    var photo: UIImage // post image name
    var content: String // 내용
    var uploadDate: Date // 날짜
    
    var isLiked: Bool = false
    var numberOfLikes: Int = 0
    
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }

}
