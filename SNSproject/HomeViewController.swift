//
//  ViewController.swift
//  instagram
//
//  Created by t2023-m0088 on 2023/08/14.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!

    var models = [InstagramPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        
        models.append(InstagramPost(numberOfLikes: 47, username: "su_hyeon_47", userImageName: "suhyeon", postImageName: "post_1"))
        models.append(InstagramPost(numberOfLikes: 74, username: "ga_g_yeom__", userImageName: "gagyeom", postImageName: "post_2"))
        models.append(InstagramPost(numberOfLikes: 63, username: "woo8jun2", userImageName: "woojun", postImageName: "post_3"))
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

struct InstagramPost{
    let numberOfLikes: Int
    let username: String
    let userImageName:String
    let postImageName:String
}
