//
//  Species.swift
//  StarWarsAPI
//
//  Created by Eric Morales on 9/20/21.
//

import Foundation

struct Species {
    let species: [Specie]
}

struct Specie {
    let name: String
    let classification: String
    let averageHeight: String
    let averageLifespan: String
    let language: String
    let peoples: [URL]
    let films: [URL]
}

extension Species: Decodable {
    enum SpeciesKeys: String, CodingKey {
        case species = "results"
    }
    
    init(from decoder: Decoder) throws {
        let speciesContainer = try decoder.container(keyedBy: SpeciesKeys.self)

        species = try speciesContainer.decode([Specie].self, forKey: .species)
    }
}

extension Specie: Decodable {
    enum SpecieKeys: String, CodingKey {
        case name
        case classification
        case averageHeight = "average_height"
        case averageLifespan = "average_lifespan"
        case language
        case peoples = "people"
        case films
    }

    init(from decoder: Decoder) throws {
        let specieContainer = try decoder.container(keyedBy: SpecieKeys.self)
        
        name = try specieContainer.decode(String.self, forKey: .name)
        classification = try specieContainer.decode(String.self, forKey: .classification)
        averageHeight = try specieContainer.decode(String.self, forKey: .averageHeight)
        averageLifespan = try specieContainer.decode(String.self, forKey: .averageLifespan)
        language = try specieContainer.decode(String.self, forKey: .language)
        peoples = try specieContainer.decode([URL].self, forKey: .peoples)
        films = try specieContainer.decode([URL].self, forKey: .films)
    }
}
