//
//  ViewController.swift
//  sssasdasd
//
//  Created by Woojun Lee on 2023/08/14.
//

import UIKit


class ProfileEditVC: UIViewController {

   
    @IBOutlet var leftImageView: UIImageView!
    @IBOutlet var rightImageView: UIImageView!
    
    @IBOutlet var EditButton: UIButton!
    
    @IBOutlet var tableView: UITableView!
    
    var userInfoRepository = UserInfoRepository.shared {
        didSet {
            tableView.reloadData()
        }
    }
    
    var tableViewModel: [Edit] {
       
        return makeTableViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setImage()
        userInfoRepository.following = 8
        
    }

    private func configureTableView() {
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
    }
    
    private func setImage() {
        leftImageView.clipsToBounds = true
        
        leftImageView.layer.cornerRadius = 45
        rightImageView.clipsToBounds = true
        rightImageView.layer.cornerRadius = 45
        
    }
    
    private func makeTableViewModel() -> [Edit] {
        let editViewData = [
            Edit(title: "Name", writing: userInfoRepository.name, writingPlaceholder: "" ,Exception: false),
            Edit(title: "Username", writing: userInfoRepository.userName, writingPlaceholder: "",Exception: false),
            Edit(title: "Pronouns", writing: userInfoRepository.pronouns, writingPlaceholder: "Pronouns",Exception: false),
            Edit(title: "Bio", writing: userInfoRepository.bio, writingPlaceholder: "Bio",Exception: false),
            Edit(title: "Links", writing: userInfoRepository.links, writingPlaceholder: "Add Links",Exception: false),
            Edit(title: "Gender", writing: userInfoRepository.gender, writingPlaceholder: "Gender",Exception: true),
            Edit(title: "Switch to professional account", writing: "", writingPlaceholder: "",Exception: false),
            Edit(title: "Personal information settings", writing: "", writingPlaceholder: "",Exception: false),
            Edit(title: "Sign up for Meta Verified", writing: "", writingPlaceholder: "",Exception: true)
        ]
        return editViewData
    }
    
  
    
}

extension ProfileEditVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: SettingText
        
        switch indexPath.row {
        case 0...3:
            cell = UpperEditCell()
            
        case 4...5:
            cell = MiddleEditCell()
            
        case 6...8:
            cell = LowerEditCell()
            
        default:
            cell = UpperEditCell()
        }
        
        cell.setText(edit: tableViewModel[indexPath.row])
        
        return cell as! UITableViewCell
        
    }
}

extension ProfileEditVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            
        case 0:
            let storyboard = UIStoryboard(name: "NameEditSB", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "NameViewController")
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let storyboard = UIStoryboard(name: "UserNameSB", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "UserNameVC")
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = PronounsVC()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = BioVC()
            navigationController?.pushViewController(vc, animated: true)
        default:
            print("Default")
        }
    }
}
