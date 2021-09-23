//
//  Planets.swift
//  StarWarsAPI
//
//  Created by Eric Morales on 9/20/21.
//

import Foundation

struct Planets: Decodable {
    var planets: [Planet]
}

struct Planet: Decodable {
    let name: String
}

extension Planets {
    enum PlanetsKeys: String, CodingKey {
        case planets = "results"
    }

    init(from decoder: Decoder) throws {
        let planetsContainer = try decoder.container(keyedBy: PlanetsKeys.self)

        planets = try planetsContainer.decode([Planet].self, forKey: .planets)
    }
}
