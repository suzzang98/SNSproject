//
//  InstaStoryTableViewController.swift
//  SNSproject
//
//  Created by t2023-m0088 on 2023/08/17.
//

import UIKit
import SwiftUI

class InstaStoryTableViewController: UITableViewController {
        
    
    @IBOutlet var table2: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.backgroundColor = .red
        
        let StoryTableViewCellNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        self.table2.register(StoryTableViewCellNib, forCellReuseIdentifier: "StoryTableViewCell")
        self.table2.rowHeight = UITableView.automaticDimension
        self.table2.estimatedRowHeight = 120
        self.table2.delegate = self
        self.table2.dataSource = self
        self.table2.rowHeight = 700
        
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else {return UITableViewCell()}
        return cell
    }
    
}
