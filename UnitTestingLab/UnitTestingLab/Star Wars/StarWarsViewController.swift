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
    
    var starwars = [Movies]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadUrl()
    }
    
    func loadUrl() {
        starwars = StarWars.getMovies()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailStarViewController, let indexpath = tableView.indexPathForSelectedRow else {
            fatalError()
        }
        detailVC.movie = starwars[indexpath.row]
    }
 
}

extension StarWarsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starwars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "warsCell", for: indexPath)
        let movies = starwars[indexPath.row]
        cell.textLabel?.text = movies.title
        cell.detailTextLabel?.text = "Episode: \(movies.episode)"
        return cell
    }
    
    
}
