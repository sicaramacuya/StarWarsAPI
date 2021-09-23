//
//  People.swift
//  StarWarsAPI
//
//  Created by Eric Morales on 9/20/21.
//

import Foundation

struct Peoples {
    var peoples: [People]
    var nextPage: URL
}

struct People {
    let name: String
    let birthYear: String
    let homeworld: URL
    let filmsURLs: [URL]
    let speciesURLs: [URL]
    let vehiclesURLs: [URL]
    let starshipsURLs: [URL]
    let url: String
}

extension Peoples: Decodable {
    enum PeoplesKeys: String, CodingKey {
        case peoples = "results"
        case nextPage = "next"
    }
    
    init(from decoder: Decoder) throws {
        let peoplesContainer = try decoder.container(keyedBy: PeoplesKeys.self)
        
        peoples = try peoplesContainer.decode([People].self, forKey: .peoples)
        nextPage = try peoplesContainer.decode(URL.self, forKey: .nextPage)
    }
}

extension People: Decodable {
    enum PeopleKeys: String, CodingKey {
        case name
        case birthYear = "birth_year"
        case homeworld
        case filmsURLs = "films"
        case speciesURLs = "species"
        case vehiclesURLs = "vehicles"
        case starshipsURLs = "starships"
        case url
    }
    
    init(from decoder: Decoder) throws {
        let peopleContainer = try decoder.container(keyedBy: PeopleKeys.self)
        
        name = try peopleContainer.decode(String.self, forKey: .name)
        birthYear = try peopleContainer.decode(String.self, forKey: .birthYear)
        homeworld = try peopleContainer.decode(URL.self, forKey: .homeworld)
        filmsURLs = try peopleContainer.decode([URL].self, forKey: .filmsURLs)
        speciesURLs = try peopleContainer.decode([URL].self, forKey: .speciesURLs)
        vehiclesURLs = try peopleContainer.decode([URL].self, forKey: .vehiclesURLs)
        starshipsURLs = try peopleContainer.decode([URL].self, forKey: .starshipsURLs)
        url = try peopleContainer.decode(String.self, forKey: .url)
    }
}
