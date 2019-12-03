//
//  Starwars.swift
//  UnitTestingLab
//
//  Created by Tsering Lama on 12/2/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import Foundation

struct StarWars: Decodable {
    
    let results: [Movies]
}

struct Movies: Decodable {
    
    let title: String
    let episode: Int
    let openingCrawl: String
    
    enum CodingKeys: String, CodingKey {
        
        case title
        case episode = "episode_id"
        case openingCrawl = "opening_crawl"
    }
    
}

extension StarWars {
    
    static func getMovies(data: Data) -> [Movies] {
        var movies = [Movies]()
        
        do {
            let movies = try JSONDecoder().decode(StarWars.self, from: data)
        } catch {
            fatalError()
        }
        
        return movies
    }
}
