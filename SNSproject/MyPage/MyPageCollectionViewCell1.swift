//
//  MyPageCollectionViewCell1.swift
//  SNSproject
//
//  Created by Woojun Lee on 2023/08/16.
//

import UIKit

class MyPageCollectionViewCell1: UICollectionViewCell {
    
    static let identifier = "MyPageCollectionViewCell1"
    
    let imageView: UIImageView = {
       let iv = UIImageView()
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
