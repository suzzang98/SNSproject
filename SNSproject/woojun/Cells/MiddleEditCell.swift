//
//  MiddleEditCell.swift
//  sssasdasd
//
//  Created by Woojun Lee on 2023/08/15.
//

import UIKit

class MiddleEditCell: UITableViewCell{
    
    static let identifier = "MiddleEditCell"
    
    var trailingConstraint: NSLayoutConstraint!
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        return label
    }()
    
    let writingLabel: UILabel = {
        let label = UILabel()
        label.text = "LeoHaru"
        return label
    }()
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "chevron.right")
        iv.tintColor = .lightGray
        return iv
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
            titleLabel.widthAnchor.constraint(equalToConstant: 85)
        ])
        
        contentView.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        trailingConstraint = iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            trailingConstraint,
            iconImageView.widthAnchor.constraint(equalToConstant: 16),
            iconImageView.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        contentView.addSubview(writingLabel)
        writingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            writingLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            writingLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            writingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            writingLabel.heightAnchor.constraint(equalToConstant: 30)
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
    
    func moveIconToLeft(index: Int) {
        if index == 5 {
            trailingConstraint.constant = -25
        }
        
    }
    
}

extension MiddleEditCell: SettingText {
    func setText(edit: Edit) {
        trailingConstraint.constant = edit.Exception ? -25 : -15
        titleLabel.text = edit.title
        writingLabel.attributedText = edit.writing == "" ? NSAttributedString(string: edit.writingPlaceholder, attributes: [.foregroundColor: UIColor.lightGray]) : NSAttributedString(string: edit.writing)
    }
}
