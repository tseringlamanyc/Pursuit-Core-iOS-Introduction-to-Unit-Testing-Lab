//
//  ViewController.swift
//  UnitTestingLab
//
//  Created by Tsering Lama on 12/2/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class JokesViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var jokes = [Jokes]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        jokes = Jokes.getJokes(data: Bundle.parseJSONData(filename: "jokes", ext: "json"))
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailJokesViewController, let indexpath = tableView.indexPathForSelectedRow else {
            fatalError()
        }
        detailVC.joke = jokes[indexpath.row]
    }

}

extension JokesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        let joke = jokes[indexPath.row]
        cell.textLabel?.text = joke.setup
        cell.detailTextLabel?.text = "Id: \(joke.id)"
        return cell
    }
}

