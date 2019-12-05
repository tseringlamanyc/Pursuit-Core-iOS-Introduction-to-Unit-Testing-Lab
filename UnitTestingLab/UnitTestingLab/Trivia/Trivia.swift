//
//  Trivia.swift
//  UnitTestingLab
//
//  Created by Tsering Lama on 12/2/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import Foundation

struct TriviaData: Decodable {
    
    let results: [Trivia]
}

struct Trivia: Decodable {
    
    let question: String
    let difficulty: String
    let correctAnswer: String
    let incorrectAnswer: [String]
    
    enum CodingKeys: String, CodingKey {
        case question
        case difficulty
        case correctAnswer = "correct_answer"
        case incorrectAnswer = "incorrect_answers"
    }
}


extension TriviaData {
    static func getQuestions() -> [Trivia] {
        var trivia = [Trivia]()
        
        let data = Bundle.parseJSONData(filename: "trivia", ext: "json")
        
        do {
            let triviaQ = try JSONDecoder().decode(TriviaData.self, from: data)
            trivia = triviaQ.results.sorted {$0.difficulty < $1.difficulty}
        } catch {
            fatalError("\(error)")
        }
        return trivia
    }
}
