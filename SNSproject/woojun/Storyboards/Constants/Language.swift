//
//  Language.swift
//  SNSproject
//
//  Created by Woojun Lee on 2023/08/17.
//

import Foundation
import UIKit

enum StoryBoardID {
    
    static let name = "Name"
    static let profile = "Profile"
    static let userName = "UserName"
}

enum Language {
    
    static let languges = ["English", "Spanish", "Portuguese", "French", "German", "Indonesian", "Turkish", "Arabic", "Faris", "Norwegian", "Finnish", "Danish", "Swedish"]
}

enum CustomColor {
    
    static let blue         = UIColor(red: 0/255, green: 102/255, blue: 204/255, alpha: 1)
    static let lightBlue    = UIColor(red: 153/255, green: 204/255, blue: 255/255, alpha: 1)
    static let middleBlue   = UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1)
    static let deepBlue     = UIColor(red: 102/255, green: 178/255, blue: 255/255, alpha: 1)
    static let gray         = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
    static let darkGray     = UIColor(red: 110/255, green: 110/255, blue: 110/255, alpha: 1)
}

enum Text {
    
    static let pronounsUpperTextFirst = "Add up to 4 pronouns to your profile so people know how to refer to you. You can edit or remove them at any time."
    static let pronounsUpperTextSecond = " Learn More"
    static let pronounsLowerText = "When this is turned on, only people who follow you will see your pronouns"
}

enum HyperLink {
    
    static let helpCenter = "https://help.instagram.com/"
}


