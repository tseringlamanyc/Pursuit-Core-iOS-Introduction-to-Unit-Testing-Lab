//
//  Jokes.swift
//  UnitTestingLab
//
//  Created by Tsering Lama on 12/2/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import Foundation

struct Jokes: Codable {
    
    let setup: String
    let punchline: String
    let id: Int
}

extension Jokes {
    static func getJokes() -> [Jokes] {
        var jokes = [Jokes]()
        
        let data = Bundle.parseJSONData(filename: "jokes", ext: "json")
        
        do {
            let data = try JSONDecoder().decode([Jokes].self, from: data)
            jokes = data.sorted {$0.id < $1.id}
        } catch {
            fatalError()
        }
        return jokes
    }
}
