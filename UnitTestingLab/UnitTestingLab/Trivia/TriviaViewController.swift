//
//  TriviaViewController.swift
//  UnitTestingLab
//
//  Created by Tsering Lama on 12/2/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var trivia = [Trivia]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUrl()
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    func loadUrl() {
        trivia = TriviaData.getQuestions()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailTriviaViewController, let indexpath = tableView.indexPathForSelectedRow else {
            fatalError()
        }
        detailVC.answer = trivia[indexpath.row]
    }
}

extension TriviaViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trivia.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        let question = trivia[indexPath.row]
        cell.textLabel?.text = question.question.removingPercentEncoding
        cell.detailTextLabel?.text = question.difficulty
        return cell
    }
    
}
