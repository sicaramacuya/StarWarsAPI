//
//  Starships.swift
//  StarWarsAPI
//
//  Created by Eric Morales on 9/20/21.
//

import Foundation

struct Starships {
    let starships: [Starship]
}

struct Starship {
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
    let passengers: String
    let hyperdriveRating: String
    let films: [URL]
}

extension Starships: Decodable {
    enum StarshipsKeys: String, CodingKey {
        case starships = "results"
    }
    
    init(from decoder: Decoder) throws {
        let starshipsContainer = try decoder.container(keyedBy: StarshipsKeys.self)
    
        starships = try starshipsContainer.decode([Starship].self, forKey: .starships)
    }
}

extension Starship: Decodable {
    enum StarshipKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case costInCredits = "cost_in_credits"
        case passengers
        case hyperdriveRating = "hyperdrive_rating"
        case films
    }
    
    init(from decoder: Decoder) throws {
        let starshipContainer = try decoder.container(keyedBy: StarshipKeys.self)
        
        name = try starshipContainer.decode(String.self, forKey: .name)
        model = try starshipContainer.decode(String.self, forKey: .model)
        manufacturer = try starshipContainer.decode(String.self, forKey: .manufacturer)
        costInCredits = try starshipContainer.decode(String.self, forKey: .costInCredits)
        passengers = try starshipContainer.decode(String.self, forKey: .passengers)
        hyperdriveRating = try starshipContainer.decode(String.self, forKey: .hyperdriveRating)
        films = try starshipContainer.decode([URL].self, forKey: .films)
    }
}
