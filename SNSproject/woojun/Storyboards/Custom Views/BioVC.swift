//
//  BioVC.swift
//  SNSproject
//
//  Created by Woojun Lee on 2023/08/18.
//

import UIKit

class BioVC: UIViewController {

    private lazy var textView: UITextView = {
       let tv = UITextView()
        tv.delegate = self
        tv.font = UIFont.systemFont(ofSize: 18)
        return tv
    }()
    
    private let upperspacerView: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let lowerSpacerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    @objc func tapped() {
        UserInfoRepository.shared.bio = textView.text!
        navigationController?.popViewController(animated: true)
    }
    
    private func configureUI() {
        configureTextView()
        configureUpperspacer()
        configureSpacer()
        configureRightBarButton()
    }
    
    private func configureTextView() {
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.heightAnchor.constraint(equalToConstant: 37.66)
            
        ])
    }
    
    private func configureUpperspacer() {
        view.addSubview(upperspacerView)
        upperspacerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upperspacerView.topAnchor.constraint(equalTo: textView.topAnchor),
            upperspacerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            upperspacerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            upperspacerView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    private func configureSpacer() {
        view.addSubview(lowerSpacerView)
        lowerSpacerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowerSpacerView.topAnchor.constraint(equalTo: textView.bottomAnchor),
            lowerSpacerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lowerSpacerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lowerSpacerView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    private func configureRightBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(tapped))
    }

}

extension BioVC: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.frame.height)
           let size = CGSize(width: view.frame.width, height: .infinity)
           let estimatedSize = textView.sizeThatFits(size)
           
           textView.constraints.forEach { (constraint) in
           
               if estimatedSize.height <= 37.66 {
               
               }
               else {
                   if constraint.firstAttribute == .height {
                       constraint.constant = estimatedSize.height
                   }
               }
           }
       }
}
