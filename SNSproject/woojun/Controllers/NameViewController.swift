//
//  NameViewController.swift
//  sssasdasd
//
//  Created by Woojun Lee on 2023/08/16.
//

import UIKit

class NameViewController: UIViewController {
    
    let name = UserInfoRepository.shared.name
    
    @IBOutlet var lowerLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setRightBarButton()
        setLowerText()
        setTextField()
        configureTextField()
        // Do any additional setup after loading the view.
    }
    
    
    @objc func tapped() {
        UserInfoRepository.shared.name = textField.text!
        navigationController?.popViewController(animated: true)
    }
    
    private func setLowerText() {
        let text = """
in most cases, you'll be able to change your username back to \(name) for another 14 days.
"""
        
        lowerLabel.text = text
    }
    
    private func setTextField() {
        textField.text = name
    }
    
    
    
    private func setRightBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(tapped))
    }
    
    private func configureTextField() {
        textField.font = UIFont.systemFont(ofSize: 18)
    }
}
