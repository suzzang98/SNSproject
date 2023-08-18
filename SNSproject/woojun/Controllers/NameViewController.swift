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
in most cases, you'll be able to change your username back to zigo12 for another 14 days.
"""
        
        lowerLabel.text = text
    }
}
