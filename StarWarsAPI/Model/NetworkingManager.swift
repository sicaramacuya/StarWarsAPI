//
//  NetworkingManager.swift
//  StarWarsAPI
//
//  Created by Eric Morales on 9/20/21.
//

import Foundation

class NetworkManager {
    let urlSession = URLSession.shared
    var baseURL = "https://swapi.dev/api/"
    
    // Mathod to handel a person requests
    func getPersons(pagination: Bool = false, urlForPagination: URL? = nil, completion: @escaping (Result<[People]>) -> Void) {
        let personRequest = makeRequest(for: .people)
        
        let task = urlSession.dataTask(with: personRequest) { data, response, error in
            
            if let error = error {
                return completion(Result.failure(error))
            }
            
            guard let data = data else {
                return completion(Result.failure(EndPointError.noData))
            }
            
            guard let result = try? JSONDecoder().decode(Peoples.self, from: data) else {
                return completion(Result.failure(EndPointError.couldNotParse))
            }
            
            let peoples = result.peoples
            
            DispatchQueue.main.async {
                completion(Result.success(peoples))
            }
            
        }
        
        task.resume()
    }
    
    func getPlanets(completion: @escaping (Result<[Planet]>) -> Void) {
        let planetsRequest = makeRequest(for: .planets)
        
        let task = urlSession.dataTask(with: planetsRequest) { data, response, error in
            
            if let error = error {
                return completion(Result.failure(error))
            }
            
            guard let data = data else {
                return completion(Result.failure(EndPointError.noData))
            }
            
            guard let result = try? JSONDecoder().decode(Planets.self, from: data) else {
                return completion(Result.failure(EndPointError.couldNotParse))
            }
            
            let planets = result.planets
            
            DispatchQueue.main.async {
                completion(Result.success(planets))
            }
            
        }
        
        task.resume()
    }
    
    func getFilms(completion: @escaping (Result<[Film]>) -> Void) {
        let filmRequest = makeRequest(for: .films)

        let task = urlSession.dataTask(with: filmRequest) { data, response, error in

            if let error = error {
                return completion(Result.failure(error))
            }

            guard let data = data else {
                return completion(Result.failure(EndPointError.noData))
            }

            guard let result = try? JSONDecoder().decode(Films.self, from: data) else {
                return completion(Result.failure(EndPointError.couldNotParse))
            }

            let films = result.films

            DispatchQueue.main.async {
                completion(Result.success(films))
            }

        }

        task.resume()
    }
    
    func getSpecies(completion: @escaping (Result<[Specie]>) -> Void) {
        let speciesRequest = makeRequest(for: .species)

        let task = urlSession.dataTask(with: speciesRequest) { data, response, error in

            if let error = error {
                return completion(Result.failure(error))
            }

            guard let data = data else {
                return completion(Result.failure(EndPointError.noData))
            }

            guard let result = try? JSONDecoder().decode(Species.self, from: data) else {
                return completion(Result.failure(EndPointError.couldNotParse))
            }

            let species = result.species

            DispatchQueue.main.async {
                completion(Result.success(species))
            }

        }

        task.resume()
    }
    
    func getVehicles(completion: @escaping (Result<[Vehicle]>) -> Void) {
        let vehiclesRequest = makeRequest(for: .vehicles)

        let task = urlSession.dataTask(with: vehiclesRequest) { data, response, error in

            if let error = error {
                return completion(Result.failure(error))
            }

            guard let data = data else {
                return completion(Result.failure(EndPointError.noData))
            }

            guard let result = try? JSONDecoder().decode(Vehicles.self, from: data) else {
                return completion(Result.failure(EndPointError.couldNotParse))
            }

            let vehicles = result.vehicles

            DispatchQueue.main.async {
                completion(Result.success(vehicles))
            }

        }

        task.resume()
    }

    func getStarships(completion: @escaping (Result<[Starship]>) -> Void) {
        let starshipsRequest = makeRequest(for: .starships)

        let task = urlSession.dataTask(with: starshipsRequest) { data, response, error in

            if let error = error {
                return completion(Result.failure(error))
            }

            guard let data = data else {
                return completion(Result.failure(EndPointError.noData))
            }

            guard let result = try? JSONDecoder().decode(Starships.self, from: data) else {
                return completion(Result.failure(EndPointError.couldNotParse))
            }

            let starships = result.starships

            DispatchQueue.main.async {
                completion(Result.success(starships))
            }

        }

        task.resume()
    }
    
    enum EndPoints {
        case people
        case planets
        case films
        case species
        case vehicles
        case starships
        
        func getPath() -> String {
            switch self {
            case .people:
                return "people/"
            case .planets:
                return "planets/"
            case .films:
                return "films/"
            case .species:
                return "species/"
            case .vehicles:
                return "vehicles/"
            case .starships:
                return "starships/"
            }
        }
        
        func getHTTPMethod() -> String {
            return "GET"
        }
        
        func getHeaders() -> [String: String] {
            return [
                "Accept": "application/json",
                "Content-Type": "application/json"
            ]
        }
    }
    
    private func makeRequest(for endPoint: EndPoints, pagination: Bool = false, urlForPagination: URL? = nil) -> URLRequest {
        
        var path: String
        var fullURL: URL
        
        if pagination {
            fullURL = urlForPagination!
        } else {
            path = endPoint.getPath()
            fullURL = URL(string: baseURL.appending(path))!
        }
        
        var request = URLRequest(url: fullURL)
        request.httpMethod = endPoint.getHTTPMethod()
        
        return request
    }
    
    enum Result<T> {
        case success(T)
        case failure(Error)
    }
    
    enum EndPointError: Error {
        case couldNotParse
        case noData
    }
}
