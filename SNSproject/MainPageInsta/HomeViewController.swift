//
//  ViewController.swift
//  instagram
//
//  Created by t2023-m0088 on 2023/08/14.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!

    @IBOutlet weak var Image1: UIImageView!
    

    var models = [InstagramPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(navigationController, "@@@@")
        Image1.layer.borderWidth = 1
        Image1.layer.borderColor = UIColor.purple.cgColor
        
        table.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        models.append(InstagramPost(numberOfLikes: 0, username: "su_hyeon_47", userImageName: "suhyeon", postImageName: "post_1", postWrite: "우리집 고냥이❤️",isLiked: false))
        models.append(InstagramPost(numberOfLikes: 0, username: "ga_g_yeom__", userImageName: "gagyeom", postImageName: "post_2", postWrite: "고양이 없는사람 무슨낙으로 삼? ㅜ 불쌍 ㅜ",isLiked: false))
        models.append(InstagramPost(numberOfLikes: 0, username: "woo8jun2", userImageName: "woojun", postImageName: "post_3", postWrite: "아웅 기여어😙",isLiked: false))
        models.append(InstagramPost(numberOfLikes: 0, username: "k111h00o", userImageName: "kiho", postImageName: "post_4", postWrite: "나만 없어 ... 고양이 ....",isLiked: false))
        
//        }
        
    }
    
    @objc private func didDoubleTap(_gesture: UITapGestureRecognizer){
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.configure(with: models[indexPath.row], index: indexPath.row)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
}

extension HomeViewController:PostCellDelegate{
    func likeButtonTapped(index: Int) {
        models[index].isLiked = !models[index].isLiked
        table.reloadData()
    }
    
    
}

struct InstagramPost{
    let numberOfLikes: Int
    let username: String
    let userImageName:String
    let postImageName:String
    let postWrite:String
    var isLiked:Bool
}
