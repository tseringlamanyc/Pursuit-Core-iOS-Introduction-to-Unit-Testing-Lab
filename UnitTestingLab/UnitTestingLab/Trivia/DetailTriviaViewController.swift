//
//  DetailTriviaViewController.swift
//  UnitTestingLab
//
//  Created by Tsering Lama on 12/2/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

class DetailTriviaViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var responseLabel: UILabel!
    
    var answer: Trivia!
    var allChoices = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        checkAnswer()

    }
    
    func loadData() {
        questionLabel.text = answer.question.removingPercentEncoding
        allChoices.append(answer.correctAnswer.removingPercentEncoding ?? "")
        allChoices.append(answer.incorrectAnswer[0].removingPercentEncoding ?? "")
        allChoices.append(answer.incorrectAnswer[1].removingPercentEncoding ?? "")
        allChoices.append(answer.incorrectAnswer[2].removingPercentEncoding ?? "")
    }
    
    func checkAnswer() {
        if allChoices.count == 2 {
            button1.setTitle(allChoices[0], for: .normal)
            button2.setTitle(allChoices[1], for: .normal)
            button3.isEnabled = false
            button3.isEnabled = false
        }
            if allChoices.count > 2 {
            button1.setTitle(allChoices[0], for: .normal)
            button2.setTitle(allChoices[1], for: .normal)
            button1.setTitle(allChoices[2], for: .normal)
            button2.setTitle(allChoices[3], for: .normal)
        }
        
    }
   

}
