//
//  ViewController.swift
//  sssasdasd
//
//  Created by Woojun Lee on 2023/08/14.
//

import UIKit
import YPImagePicker


class ProfileEditVC: UIViewController {
    
    //MARK: - Properties
    
    private let Suhyun = ""
    
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    @IBOutlet var leftImageView: UIImageView!
    
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
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        configureImageView()
        addGesutreOnProfilePicture()
        userInfoRepository.following = 8
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(" View is appearing")
        userInfoRepository = UserInfoRepository.shared
    }
    
    //MARK: - Actions
    
    @objc private func profileImageTapped(_ sender: UITapGestureRecognizer) {
        onProfileChangeBtnClicked()
    }
    
    //MARK: - Helpers
    
    private func addGesutreOnProfilePicture() {
        
        leftImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(profileImageTapped(_:))))
    }
    
    private func configureTableView() {
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
    }
    
    private func configureImageView() {
        leftImageView.isUserInteractionEnabled = true
        leftImageView.clipsToBounds = true
        
        leftImageView.layer.cornerRadius = 45
        leftImageView.image = userInfoRepository.profilePhoto
        
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
    
    private func save(image: UIImage) -> String? {
        let fileName = "FileName"
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            try? imageData.write(to: fileURL, options: .atomic)
            
            return fileName // ----> Save fileName
            
        }
        print("Error saving image")
        return nil
    }
    
    private func load(fileName: String) -> UIImage? {
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return nil
    }
}

//MARK: - TableView dataSource

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

//MARK: - TableViewDelegate

extension ProfileEditVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            
        case 0:
            let storyboard = UIStoryboard(name: StoryBoardID.name, bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "NameViewController")
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let storyboard = UIStoryboard(name: StoryBoardID.userName, bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "UserNameVC")
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = PronounsVC()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = BioVC()
            navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = GenderVC()
            navigationController?.pushViewController(vc, animated: true)
        default:
            print("Default")
        }
    }
}

extension ProfileEditVC {
    func onProfileChangeBtnClicked(){
        // 카메라 라이브러리 세팅 (구성을 내가 선택할 수 있다.)
        var config = YPImagePickerConfiguration()
        config.showsPhotoFilters = false
        config.screens = [.library]
        config.library.maxNumberOfItems = 1
        
        let picker = YPImagePicker(configuration:  config)
        //        picker.imagePickerDelegate = self
        picker.didFinishPicking { [unowned picker] items, cancelled in
            if cancelled {
                picker.dismiss(animated: true)
            }
            let image = items.singlePhoto?.image
            
//            let string = self.save(image: image!)
            
//            self.leftImageView.image = self.load(fileName: "FileName")
            self.userInfoRepository.profilePhoto = image!
            self.leftImageView.image = image
           
            
            
            
            picker.dismiss(animated: true, completion: nil)
            
            
        }
        
        // 사진 선택창 보여주기
        
        present(picker, animated: true, completion: nil)
    }
    
}

