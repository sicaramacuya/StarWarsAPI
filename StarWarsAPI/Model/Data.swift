//
//  Data.swift
//  StarWarsAPI
//
//  Created by Eric Morales on 9/17/21.
//

import Foundation

enum Category: String, CaseIterable {
    case people = "people"
    case planets = "planets"
    case films = "films"
    case species = "species"
    case vehicles = "vehicles"
    case starships = "starships"
    
    func displayName() -> String {
        return self.rawValue.capitalized
    }
}

enum imageName: String, CaseIterable {
    case people = "figure.stand"
    case planets = "sun.max"
    case films = "film"
    case species = "camera.filters"
    case vehicles = "car"
    case starships = "rotate.3d"
    
}
