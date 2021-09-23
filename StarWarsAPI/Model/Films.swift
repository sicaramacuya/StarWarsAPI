//
//  Films.swift
//  StarWarsAPI
//
//  Created by Eric Morales on 9/20/21.
//

import Foundation

struct Films {
    let films: [Film]
}

struct Film {
    let title: String
    let episodeID: Int
    let introduction: String
    let director: String
    let releaseDate: String
    let characters: [URL]
    let planets: [URL]
    let starships: [URL]
    let vehicles: [URL]
    let species: [URL]
}

extension Films: Decodable {
    enum FilmsKeys: String, CodingKey {
        case films = "results"
    }
    
    init(from decoder: Decoder) throws {
        let filmsContainer = try decoder.container(keyedBy: FilmsKeys.self)

        films = try filmsContainer.decode([Film].self, forKey: .films)
    }
}

extension Film: Decodable {
    enum FilmKeys: String, CodingKey {
        case title
        case episodeID = "episode_id"
        case introduction = "opening_crawl"
        case director
        case releaseDate = "release_date"
        case characters
        case planets
        case starships
        case vehicles
        case species
    }
    
    init(from decoder: Decoder) throws {
        let filmContainer = try decoder.container(keyedBy: FilmKeys.self)
        
        title = try filmContainer.decode(String.self, forKey: .title)
        episodeID = try filmContainer.decode(Int.self, forKey: .episodeID)
        introduction = try filmContainer.decode(String.self, forKey: .introduction)
        director = try filmContainer.decode(String.self, forKey: .director)
        releaseDate = try filmContainer.decode(String.self, forKey: .releaseDate)
        characters = try filmContainer.decode([URL].self, forKey: .characters)
        planets = try filmContainer.decode([URL].self, forKey: .planets)
        starships = try filmContainer.decode([URL].self, forKey: .starships)
        vehicles = try filmContainer.decode([URL].self, forKey: .vehicles)
        species = try filmContainer.decode([URL].self, forKey: .species)
    }
}
