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
    
    enum CodingKeys: String, CodingKey {
        case question
        case difficulty
        case correctAnswer = "correct_answer"
    }
}


extension TriviaData {
    static func getQuestions(data: Data) -> [Trivia] {
        var trivia = [Trivia]()
        
        do {
            let triviaQ = try JSONDecoder().decode(TriviaData.self, from: data)
            trivia = triviaQ.results
        } catch {
            fatalError()
        }
        return trivia
    }
}
