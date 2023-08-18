//
//  dmTableViewController.swift
//  SNSproject
//
//  Created by t2023-m0088 on 2023/08/18.
//

import UIKit

class DmTableViewController: UITableViewController{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let dmTableViewCellNib = UINib(nibName: "DmTableViewCell", bundle: nil)
        self.tableView.register(dmTableViewCellNib, forCellReuseIdentifier: "DmTableViewCell")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 120
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 700
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DmTableViewCell", for: indexPath) as? DmTableViewCell else {return UITableViewCell()}
//        return 0
//        
//    }
    
}
