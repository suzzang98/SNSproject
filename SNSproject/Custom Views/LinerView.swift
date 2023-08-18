//
//  LinerView.swift
//  SNSproject
//
//  Created by Woojun Lee on 2023/08/17.
//

import UIKit

class LinerView: UIView {
    
    let upperSpacerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let TextField: UITextField = {
        let tf = UITextField()
        tf.rightViewMode = .whileEditing
        tf.rightView = UIImageView(image: UIImage(systemName: "x.circle"))
        tf.attributedPlaceholder = NSAttributedString(string: "Add your pronouns", attributes: [.foregroundColor: UIColor.gray])
        
        return tf
    }()
    
    let lowerSpacerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(upperSpacerView)
        upperSpacerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upperSpacerView.topAnchor.constraint(equalTo: self.topAnchor),
            upperSpacerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            upperSpacerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            upperSpacerView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        addSubview(lowerSpacerView)
        lowerSpacerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowerSpacerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lowerSpacerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lowerSpacerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lowerSpacerView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        addSubview(TextField)
        TextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            TextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            TextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            TextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            TextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    
    
}
