//
//  UnitTestingLabTests.swift
//  UnitTestingLabTests
//
//  Created by Tsering Lama on 12/2/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import XCTest
@testable import UnitTestingLab

class UnitTestingLabTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testStarWarsJson() {
        let filename = "starwars"
        let ext = "json"
        let data = Bundle.parseJSONData(filename: filename, ext: ext)
        
        XCTAssertNotNil(data)
    }
    
    func testStarWarsMovies() {
        let filename = "starwars"
        let ext = "json"
        let data = Bundle.parseJSONData(filename: filename, ext: ext)
        
        let movies = StarWars.getMovies(data: data)
        
        XCTAssertGreaterThan(movies.count, 0)
    }
    
    func testTriviaJson() {
        let filename = "trivia"
        let ext = "json"
        let data = Bundle.parseJSONData(filename: filename, ext: ext)
        
        XCTAssertNotNil(data)
    }
    
    func testTriviaCount() {
        let filename = "trivia"
        let ext = "json"
        let data = Bundle.parseJSONData(filename: filename, ext: ext)
        
        let trivia = TriviaData.getQuestions(data: data)
        
        XCTAssertGreaterThan(trivia.count, 0)
    }
    
    func testJokesJson() {
        let filename = "jokes"
        let ext = "json"
        let data = Bundle.parseJSONData(filename: filename, ext: ext)
        
        XCTAssertNotNil(data)
    }
    
    func testJokesCount() {
        let filename = "jokes"
        let ext = "json"
        let data = Bundle.parseJSONData(filename: filename, ext: ext)
        
        let jokes = Jokes.getJokes(data: data)
        
        XCTAssertGreaterThan(jokes.count, 0)
    }

}
