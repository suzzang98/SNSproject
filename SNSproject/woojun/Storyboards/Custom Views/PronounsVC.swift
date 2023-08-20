//
//  PronounsVC.swift
//  SNSproject
//
//  Created by Woojun Lee on 2023/08/17.
//

import UIKit

class PronounsVC: UIViewController {
    
    
    //MARK: - Properties
    
    let languages = Language.languges
    
    let TFView = LinerView()
    
    let padding: CGFloat = 10
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.allowsMultipleSelection = false
        cv.allowsSelection = true
        cv.delegate = self
        cv.register(LanguageCell.self, forCellWithReuseIdentifier: LanguageCell.identifier)
        cv.dataSource = self
        cv.showsHorizontalScrollIndicator = false
        
        return cv
    }()
    
    private lazy var upperTextView: UITextView = {
       let tv = UITextView()
        tv.attributedText = getUpperLabelText()
        tv.isEditable = false
        tv.delegate = self
        return tv
    }()
    
    private let upperLabel: UILabel = {
       let label = UILabel()
        
        label.text = " Show to Follwers Only"
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    private let followerSwitch: UISwitch = {
       let mySwitch = UISwitch()
        
        return mySwitch
        
    }()
    
    private let lowerTextView: UITextView = {
       let tv = UITextView()
        tv.isEditable = false
        tv.textColor = CustomColor.gray
        tv.text = Text.pronounsLowerText
        return tv
    }()

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: - Actions
    
    @objc func rightBarButtonTapped(_ sender: UIBarButtonItem) {
        UserInfoRepository.shared.pronouns = TFView.TextField.text!
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = .white
        configureRightBarButton()
        configureTFView()
        configureCollectionView()
        configureUpperLabel()
        configureLabel()
        configureSwitch()
        configureLowerTextView()
    }
    
    private func configureRightBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(rightBarButtonTapped(_:)))
    }
   
    private func configureTFView() {
        view.addSubview(TFView)
        TFView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            TFView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            TFView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            TFView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            TFView.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: TFView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureUpperLabel() {
        view.addSubview(upperTextView)
        upperTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upperTextView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            upperTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            upperTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            upperTextView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureLabel() {
        view.addSubview(upperLabel)
        upperLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upperLabel.topAnchor.constraint(equalTo: upperTextView.bottomAnchor),
            upperLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            upperLabel.heightAnchor.constraint(equalToConstant: 45),
            upperLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureSwitch() {
        view.addSubview(followerSwitch)
        followerSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            followerSwitch.centerYAnchor.constraint(equalTo: upperLabel.centerYAnchor),
            followerSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
        
    }
    
    private func configureLowerTextView() {
        view.addSubview(lowerTextView)
        lowerTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowerTextView.topAnchor.constraint(equalTo: upperLabel.bottomAnchor),
            lowerTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            lowerTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lowerTextView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func getUpperLabelText() -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(string: Text.pronounsUpperTextFirst, attributes: [.foregroundColor: CustomColor.gray])
        let secondText = NSAttributedString(string: Text.pronounsUpperTextSecond, attributes: [.foregroundColor: CustomColor.blue, .font: UIFont.systemFont(ofSize: 12), .link: NSURL(string: HyperLink.helpCenter)!])
        attributedText.append(secondText)
        
        return attributedText
        
    }
}

extension PronounsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return languages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LanguageCell.identifier, for: indexPath) as! LanguageCell
        if indexPath.item == 0 {
//            cell.isSelected = true
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .init())
        }
        cell.label.text = languages[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 0)
    }
    
    }

extension PronounsVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
}

extension PronounsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LanguageCell.identifier, for: indexPath) as? LanguageCell else {
                return .zero
            }
        cell.label.text = languages[indexPath.row]
            // ✅ sizeToFit() : 텍스트에 맞게 사이즈가 조절
            cell.label.sizeToFit()

            // ✅ cellWidth = 글자수에 맞는 UILabel 의 width + 20(여백)
            let cellWidth = cell.label.frame.width + 20
        
            return CGSize(width: cellWidth, height: 30)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 1
       }

       // 옆 간격
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
           return 10
       }

       // cell 사이즈( 옆 라인을 고려하여 설정 )
    }


extension PronounsVC: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return true
    }
}
