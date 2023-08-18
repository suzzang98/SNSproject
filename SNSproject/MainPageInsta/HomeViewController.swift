//
//  ViewController.swift
//  instagram
//
//  Created by t2023-m0088 on 2023/08/14.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var table: UITableView!

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var storyView: UIStackView!
    @IBOutlet weak var scrollStory: UIScrollView!
    
    @IBAction func bttn(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "InstaStory", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "InstaStoryTableViewController") as! InstaStoryTableViewController
        navigationController?.pushViewController(vc, animated: true)
                
    }
    
    @IBAction func bttn2(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "InstaStory", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "InstaStoryTableViewController") as! InstaStoryTableViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func dmBtn(_ sender: UIButton) {
        
            let storyBoard = UIStoryboard(name: "DmWindow", bundle: nil)
            let vc = storyBoard.instantiateViewController(identifier: "DmTableViewController") as! DmTableViewController
            navigationController?.pushViewController(vc, animated: true)
    }
    
    
    var models = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image1.layer.borderWidth = 1
        image1.layer.borderColor = UIColor.purple.cgColor
        
        table.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        models.append(Post(id: 0, photo: "suhyeon", content: "우리집 고냥이❤️", uploadDate: Date()))
        models.append(Post(id: 1, photo: "gagyeom", content: "고양이 없는사람 무슨낙으로 삼? ㅜ 불쌍 ㅜ", uploadDate: Date()))
        models.append(Post(id: 2, photo: "woojun", content: "아웅 기여어😙", uploadDate: Date()))
        models.append(Post(id: 3, photo: "kiho", content: "나만 없어 ... 고양이 ....", uploadDate: Date()))
        
//        models.append(Post(numberOfLikes: 0, username: "su_hyeon_47", userImageName: "suhyeon", postImageName: "post_1", postWrite: "우리집 고냥이❤️",isLiked: false))
//        models.append(Post(numberOfLikes: 0, username: "ga_g_yeom__", userImageName: "gagyeom", postImageName: "post_2", postWrite: "고양이 없는사람 무슨낙으로 삼? ㅜ 불쌍 ㅜ",isLiked: false))
//        models.append(Post(numberOfLikes: 0, username: "woo8jun2", userImageName: "woojun", postImageName: "post_3", postWrite: "아웅 기여어😙",isLiked: false))
//        models.append(Post(numberOfLikes: 0, username: "k111h00o", userImageName: "kiho", postImageName: "post_4", postWrite: "나만 없어 ... 고양이 ....",isLiked: false))
                
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
