//
//  UserNameVC.swift
//  sssasdasd
//
//  Created by Woojun Lee on 2023/08/16.
//

import UIKit

class UserNameVC: UIViewController {
    
    private let username = UserInfoRepository.shared.userName
    
    
    @IBOutlet var lowerLabel: UILabel!
    @IBOutlet var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setText()
        setRightBarButton()
        setTextField()
        configureTextField()
    }
    
    @objc func tapped() {
        UserInfoRepository.shared.userName = textField.text!
        navigationController?.popViewController(animated: true)
    }

    private func setRightBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(tapped))
    }
    
    private func setTextField() {
        textField.text = username
    }
    
    private func setText() {
        let attributedString = NSMutableAttributedString(string: "In most cases, you'll be able to change your username back to", attributes: [.foregroundColor: CustomColor.gray])
        let secondString = NSAttributedString(string: " \(username) ", attributes: [.foregroundColor: CustomColor.darkGray, .font: UIFont.boldSystemFont(ofSize: 15)])
        let thirdString = NSAttributedString(string: "for another 14 days.", attributes: [.foregroundColor: CustomColor.gray])
        attributedString.append(secondString)
        attributedString.append(thirdString)
        
        lowerLabel.attributedText = attributedString
    }
    
    private func configureTextField() {
        textField.font = UIFont.systemFont(ofSize: 18)
    }
}
