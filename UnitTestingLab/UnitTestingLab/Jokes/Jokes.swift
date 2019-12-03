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
}

extension Jokes {
    static func getJokes(data: Data) -> [Jokes] {
        var jokes = [Jokes]()
        
        do {
            let data = try JSONDecoder().decode([Jokes].self, from: data)
            jokes = data
        } catch {
            fatalError()
        }
        return jokes
    }
}
