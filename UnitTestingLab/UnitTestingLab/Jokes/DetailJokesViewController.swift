//
//  DetailJokesViewController.swift
//  UnitTestingLab
//
//  Created by Tsering Lama on 12/2/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class DetailJokesViewController: UIViewController {
    
    
    @IBOutlet weak var punchLine: UILabel!
    
    var joke: Jokes!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        punchLine.text = joke.punchline
    }
    

}
