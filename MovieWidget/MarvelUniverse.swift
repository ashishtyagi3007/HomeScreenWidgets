//
//  MarvelUniverse.swift
//  HomeScreenWidgets
//
//  Created by Ashish Tyagi on 09/10/20.
//

import Foundation

class MarvelUniverse {
    var movie: MarvelUniverseCharacter = MarvelUniverseCharacter.empty
    var timer: Timer? = nil
    var movies: [MarvelUniverseCharacter] = [
        MarvelUniverseCharacter(name: "Iron Man",
                       characterImageName: "marvels01"),
        MarvelUniverseCharacter(name: "Captain America",
                       characterImageName: "marvels02"),
        MarvelUniverseCharacter(name: "Spider Man",
                       characterImageName: "marvels03"),
        MarvelUniverseCharacter(name: "Thanos",
                       characterImageName: "marvels04"),
        MarvelUniverseCharacter(name: "Thor",
                       characterImageName: "marvels05"),
        MarvelUniverseCharacter(name: "Ant Man and WASP",
                       characterImageName: "marvels06"),
        MarvelUniverseCharacter(name: "Avengers",
                       characterImageName: "marvels07"),
        MarvelUniverseCharacter(name: "Deadpool",
                       characterImageName: "marvels08")


        
    ]
    
    init() {
        self.getNextAvenger()
        self.timer = Timer.scheduledTimer(withTimeInterval: 10,
                                          repeats: true,
                                          block: { [weak self] (timer) in
            self?.getNextAvenger()
        })
    }
    
    func getNextAvenger() {
        let range = (0...movies.count - 1)
        let randomIndexInRange = Int.random(in: range)
        self.movie = movies[randomIndexInRange]
    }
}
