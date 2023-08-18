//
//  LanguageCell.swift
//  SNSproject
//
//  Created by Woojun Lee on 2023/08/17.
//

import UIKit

class LanguageCell: UICollectionViewCell{
    
    static let identifier = "LanguageCell"
    
    
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                label.backgroundColor = CustomColor.middleBlue
                label.textColor = CustomColor.deepBlue
                
                print(isSelected, label.text)
                
            } else {
                label.backgroundColor = .systemGray5
                label.textColor = .black
                print(isSelected, label.text)
            }
        }
    }
    
    let label: UILabel = {
       let label = UILabel()
        label.backgroundColor = .systemGray5
        label.textAlignment = .center
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    
}
