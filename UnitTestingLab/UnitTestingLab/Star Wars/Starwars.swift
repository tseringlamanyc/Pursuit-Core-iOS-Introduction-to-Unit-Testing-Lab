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
    
    static func getMovies() -> [Movies] {
        var movies = [Movies]()
        
        let data = Bundle.parseJSONData(filename: "starwars", ext: "json")
        
        do {
            let moviesData = try JSONDecoder().decode(StarWars.self, from: data)
            movies = moviesData.results.sorted {$0.episode < $1.episode}
        } catch {
            fatalError()
        }
        
        return movies
    }
}
