//
//  Vehicles.swift
//  StarWarsAPI
//
//  Created by Eric Morales on 9/20/21.
//

import Foundation

struct Vehicles {
    let vehicles: [Vehicle]
}

struct Vehicle {
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
    let passengers: String
    let vehicleClass: String
    let films: [URL]
}

extension Vehicles: Decodable {
    enum VehiclesKeys: String, CodingKey {
        case vehicles = "results"
    }
    
    init(from decoder: Decoder) throws {
        let vehiclesContainer = try decoder.container(keyedBy: VehiclesKeys.self)
        
        vehicles = try vehiclesContainer.decode([Vehicle].self, forKey: .vehicles)
    }
}

extension Vehicle: Decodable {
    enum VehicleKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case costInCredits = "cost_in_credits"
        case passengers
        case vehicleClass = "vehicle_class"
        case films
    }
    
    init(from decoder: Decoder) throws {
        let vehicleContainer = try decoder.container(keyedBy: VehicleKeys.self)
        
        name = try vehicleContainer.decode(String.self, forKey: .name)
        model = try vehicleContainer.decode(String.self, forKey: .model)
        manufacturer = try vehicleContainer.decode(String.self, forKey: .manufacturer)
        costInCredits = try vehicleContainer.decode(String.self, forKey: .costInCredits)
        passengers = try vehicleContainer.decode(String.self, forKey: .passengers)
        vehicleClass = try vehicleContainer.decode(String.self, forKey: .vehicleClass)
        films = try vehicleContainer.decode([URL].self, forKey: .films)
    }
}
