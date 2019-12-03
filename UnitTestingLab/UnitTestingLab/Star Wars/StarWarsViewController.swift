//
//  StarWarsViewController.swift
//  UnitTestingLab
//
//  Created by Tsering Lama on 12/2/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var starwars = [StarWars]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var data: Data!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.dataSource = self
    }
 
}

//extension StarWarsViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return
//    }
//}
