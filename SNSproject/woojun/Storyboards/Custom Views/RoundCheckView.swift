//
//  RoundCheckView.swift
//  SNSproject
//
//  Created by Woojun Lee on 2023/08/19.
//

import UIKit

class RoundcheckView: UIView {
    
    
    //MARK: - Properties
    
    let padding: CGFloat = 10
    
    let outerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 0.6
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let innerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  
    
    
    //MARK: - Actions
    
    
    
    //MARK: - Helpers
    
    func setColor(bool: Bool) {
        
        outerView.backgroundColor = bool ? .systemBlue : .white
        outerView.layer.borderColor = bool ? UIColor.white.cgColor : UIColor.lightGray.cgColor
    }
    
    func setCornerRadius() {
        print(outerView.frame.height, innerView.frame.height, "$$$$$")
        outerView.layer.cornerRadius = 15
        innerView.layer.cornerRadius = 5
    }
    
    //MARK: - UI
    
    private func configureUI() {
        addSubview(outerView)
        outerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            outerView.topAnchor.constraint(equalTo: topAnchor),
            outerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            outerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            outerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        addSubview(innerView)
        innerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            innerView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            innerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            innerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            innerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
        
        
        
    }
}
