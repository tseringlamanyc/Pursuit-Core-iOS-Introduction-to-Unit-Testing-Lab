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
    @IBOutlet var allButtons: [UIButton]!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var replay: UIButton!
    
    var answer: Trivia!
    var allChoices = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        loadButtons()
        initialView()
        
    }
    
    func loadData() {
        questionLabel.text = answer.question.removingPercentEncoding
        allChoices.append(answer.correctAnswer.removingPercentEncoding ?? "")
        allChoices.append(answer.incorrectAnswer[0].removingPercentEncoding ?? "")
        if answer.incorrectAnswer.count > 1 {
            allChoices.append(answer.incorrectAnswer[1].removingPercentEncoding ?? "")
            allChoices.append(answer.incorrectAnswer[2].removingPercentEncoding ?? "")
        }
        
    }
    
    func loadButtons() {
        allChoices.shuffle()
        if allChoices.count == 2 {
            button1.setTitle(allChoices[0], for: .normal)
            button2.setTitle(allChoices[1], for: .normal)
            button3.setTitle("", for: .normal)
            button4.setTitle("", for: .normal)
            button3.isEnabled = false
            button4.isEnabled = false
        }
        if allChoices.count == 4 {
            button1.setTitle(allChoices[0], for: .normal)
            button2.setTitle(allChoices[1], for: .normal)
            button3.setTitle(allChoices[2], for: .normal)
            button4.setTitle(allChoices[3], for: .normal)
        }
    }
    
    func initialView () {
        replay.isEnabled = false
        replay.setTitle("", for: .normal)
        responseLabel.text = ""
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let correctChoice = answer.correctAnswer
        if sender.titleLabel?.text == correctChoice {
            view.backgroundColor = .green
            responseLabel.text = "Good Job"
            replay.isEnabled = false
            replay.setTitle("", for: .normal)
        } else {
            view.backgroundColor = .red
            responseLabel.text = "Press button below to try again"
            replay.isEnabled = true
            replay.setTitle("Try Again", for: .normal)
        }
    }
    
    @IBAction func replayPressed(_ sender: UIButton) {
        initialView()
        loadButtons()
        view.backgroundColor = .white
    }
}
