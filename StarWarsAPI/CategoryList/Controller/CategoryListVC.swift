//
//  PersonVC.swift
//  StarWarsAPI
//
//  Created by Eric Morales on 9/17/21.
//

import UIKit

class CategoryListVC: UIViewController {
    
    // MARK: Properties
    
    var counter = 0
    lazy var networkManager = NetworkManager()
    lazy var categoryTitle: String = "Category Title"
    lazy var categoryEnum: Category? = nil
    lazy var peoples: [People] = [] {
        didSet {
            table.reloadData()
        }
    }
    lazy var planets: [Planet] = [] {
        didSet {
            table.reloadData()
        }
    }
    lazy var films: [Film] = [] {
        didSet {
            table.reloadData()
        }
    }
    lazy var species: [Specie] = [] {
        didSet {
            table.reloadData()
        }
    }
    lazy var vehicles: [Vehicle] = [] {
        didSet {
            table.reloadData()
        }
    }
    lazy var starships: [Starship] = [] {
        didSet {
            table.reloadData()
        }
    }
    lazy var table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    // MARK: VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.title = categoryTitle
        self.view.backgroundColor = .white
        setTable()
        updateList()
    }
    
    // MARK: Methods
    func setTable() {
        // Adding table to view.
        self.view.addSubview(table)
        
        // Constraints
        table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        
        // Letting table know we want to use the custom cell file.
        table.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        
        // Setting the delegate and dataSource.
        table.delegate = self
        table.dataSource = self
        
    }
    
    func updateList() {
        switch categoryEnum {
        case .people:
            networkManager.getPersons { result in
                switch result {
                case let .success(peoples):
                    self.peoples = peoples
                case let .failure(error):
                    print(error)
                }
            }
        case .planets:
            networkManager.getPlanets { result in
                switch result {
                case let .success(planets):
                    self.planets = planets
                case let .failure(error):
                    print(error)
                }
            }
        case .films:
            networkManager.getFilms { result in
                switch result {
                case let .success(films):
                    self.films = films
                case let .failure(error):
                    print(error)
                }
            }
        case .species:
            networkManager.getSpecies { result in
                switch result {
                case let .success(species):
                    self.species = species
                case let .failure(error):
                    print(error)
                }
            }
        case .vehicles:
            networkManager.getVehicles { result in
                switch result {
                case let .success(vehicles):
                    self.vehicles = vehicles
                case let .failure(error):
                    print(error)
                }
            }
        case .starships:
            networkManager.getStarships { result in
                switch result {
                case let .success(starships):
                    self.starships = starships
                case let .failure(error):
                    print(error)
                }
            }
        case .none:
            print("updateList -> category: none")
        }
    }
}

extension CategoryListVC: UITableViewDataSource, UITableViewDelegate, UINavigationBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch categoryEnum {
        case .people:
            return self.peoples.count
        case .planets:
            return self.planets.count
        case .films:
            return self.films.count
        case .species:
            return self.species.count
        case .vehicles:
            return self.vehicles.count
        case .starships:
            return self.starships.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as! CategoryTableViewCell
        
        let item: Any = {
            switch self.categoryEnum {
            case .people:
                return self.peoples[indexPath.row]
            case .planets:
                return self.planets[indexPath.row]
            case .films:
                return self.films[indexPath.row]
            case .species:
                return self.species[indexPath.row]
            case .vehicles:
                return self.vehicles[indexPath.row]
            case .starships:
                return self.starships[indexPath.row]
            default:
                return 0
            }
        }()
        
        cell.label.text = { () -> String in
            switch self.categoryEnum {
            case .people:
                return (item as? People)!.name
            case .planets:
                return (item as? Planet)!.name
            case .films:
                return (item as? Film)!.title
            case .species:
                return (item as? Specie)!.name
            case .vehicles:
                return (item as? Vehicle)!.name
            case .starships:
                return (item as? Starship)!.name
            default:
                return ""
            }
        }()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch self.categoryEnum {
        
        case .people:
            let detailVC = DetailsVC()
            detailVC.people = peoples[indexPath.row]
            detailVC.category = .people
            self.navigationController?.pushViewController(detailVC, animated: true)
            print("\(peoples[indexPath.row].name) was selected.")
            
        case .planets:
            let detailVC = DetailsVC()
            detailVC.planet = planets[indexPath.row]
            detailVC.category = .planets
            self.navigationController?.pushViewController(detailVC, animated: true)
            print("\(planets[indexPath.row].name) was selected.")
            
        case .films:
            let detailVC = DetailsVC()
            detailVC.film = films[indexPath.row]
            detailVC.category = .films
            self.navigationController?.pushViewController(detailVC, animated: true)
            print("\(films[indexPath.row].title) was selected.")
            
        case .species:
            let detailVC = DetailsVC()
            detailVC.specie = species[indexPath.row]
            detailVC.category = .species
            self.navigationController?.pushViewController(detailVC, animated: true)
            print("\(species[indexPath.row].name) was selected.")
            
        case .vehicles:
            let detailVC = DetailsVC()
            detailVC.vehicle = vehicles[indexPath.row]
            detailVC.category = .vehicles
            self.navigationController?.pushViewController(detailVC, animated: true)
            print("\(vehicles[indexPath.row].name) was selected.")
            
        case .starships:
            let detailVC = DetailsVC()
            detailVC.starship = starships[indexPath.row]
            detailVC.category = .starships
            self.navigationController?.pushViewController(detailVC, animated: true)
            print("\(starships[indexPath.row].name) was selected.")
            
        case .none:
            print("Last category in switch.")
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height) + 180) {
            print("\(self.counter) - View scrolled to the bottom. ")
            self.counter += 1
        }
    }
}

