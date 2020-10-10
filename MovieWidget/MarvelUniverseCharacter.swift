//
//  MovieCharacter.swift
//  HomeScreenWidgets
//
//  Created by Ashish Tyagi on 09/10/20.
//

import Foundation

struct MarvelUniverseCharacter {
    let name: String
    let characterImageName: String
}


extension MarvelUniverseCharacter {
    static var empty: MarvelUniverseCharacter {
        MarvelUniverseCharacter(name: "", characterImageName: "")
    }
}
