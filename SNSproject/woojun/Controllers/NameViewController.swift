//
//  NameViewController.swift
//  sssasdasd
//
//  Created by Woojun Lee on 2023/08/16.
//

import UIKit

class NameViewController: UIViewController {
    
    @IBOutlet var lowerLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var imageTapped: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLowerText()
        // Do any additional setup after loading the view.
    }
    
    private func setLowerText() {
        let text = """
Help people discover your account by using the name you're known by: either your full name,
nickname or business name.

You can only change your name twice within 14 days
"""
        
        lowerLabel.text = text
    }
    
    
    
    
}
