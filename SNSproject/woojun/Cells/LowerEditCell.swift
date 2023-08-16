//
//  LowerEditCell.swift
//  sssasdasd
//
//  Created by Woojun Lee on 2023/08/15.
//

import UIKit

class LowerEditCell: UITableViewCell {
    
    
    
    static let identifier = "LowerEditCell"
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = ""
        label.textColor = UIColor.systemBlue
        return label
    }()
    
    
    
    let spacerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
        
        contentView.addSubview(spacerView)
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spacerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            spacerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            spacerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            spacerView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
    
    
}

extension LowerEditCell: SettingText {
    
        func setText(edit: Edit) {
            spacerView.isHidden = edit.Exception
            titleLabel.text = edit.title
            
        }
    
}
