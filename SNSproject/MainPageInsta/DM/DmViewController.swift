//
//  DmViewController.swift
//  SNSproject
//
//  Created by t2023-m0088 on 2023/08/20.
//

import UIKit

class DmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DmTableViewCell", for: indexPath) as? DmTableViewCell else {return UITableViewCell()}
        return cell
    }
    

    @IBOutlet weak var dmTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dmTableViewCellNib = UINib(nibName: "DmTableViewCell", bundle: nil)
        self.dmTableView.register(dmTableViewCellNib, forCellReuseIdentifier: "DmTableViewCell")
        dmTableView.delegate = self
        dmTableView.dataSource = self
        dmTableView.rowHeight = 80
        
    }
    

}
