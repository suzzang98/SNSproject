//
//  GenderCell.swift
//  SNSproject
//
//  Created by Woojun Lee on 2023/08/19.
//

import UIKit

class GenderCell: UITableViewCell {
    
    //MARK: - Properties
    
   
    
    static let identifier = "GenderCell"
    
    let label: UILabel = {
       let label = UILabel()
        label.text = "Hello"
        return label
    }()
    
    private let checkView = RoundcheckView()
    
    
    
    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setCornerRadius()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions



    
    
    //MARK: - Helpers
    
    private func setCornerRadius() {
        checkView.setCornerRadius()
    }

    //MARK: - UI
    override func setSelected(_ selected: Bool, animated: Bool) {
        checkView.setColor(bool: selected)
    }
    
    private func configureUI() {
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.heightAnchor.constraint(equalToConstant: 35),
            label.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        contentView.addSubview(checkView)
        checkView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            checkView.widthAnchor.constraint(equalToConstant: 30),
            checkView.heightAnchor.constraint(equalToConstant: 30)
        ])

    }

}
    

    
   
