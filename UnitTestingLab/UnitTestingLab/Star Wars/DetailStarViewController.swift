//
//  DetailStarViewController.swift
//  UnitTestingLab
//
//  Created by Tsering Lama on 12/2/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class DetailStarViewController: UIViewController {
    
    
    @IBOutlet weak var starwarsText: UITextView!
    
    var movie: Movies!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starwarsText.text = movie.openingCrawl
    }
    

}
