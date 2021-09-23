//
//  DetailsVC.swift
//  StarWarsAPI
//
//  Created by Eric Morales on 9/17/21.
//

import UIKit

class DetailsVC: UIViewController {

    lazy var category: Category? = nil
    lazy var people: People? = nil
    lazy var planet: Planet? = nil
    lazy var film: Film? = nil
    lazy var specie: Specie? = nil
    lazy var vehicle: Vehicle? = nil
    lazy var starship: Starship? = nil
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Details"
        self.view.backgroundColor = .white
        
        switch category {
        case .people:
            textField.text = people!.name
        case .planets:
            textField.text = planet!.name
        case .films:
            textField.text = film!.title
        case .species:
            textField.text = specie!.name
        case .vehicles:
            textField.text = vehicle!.name
        case .starships:
            textField.text = starship!.name
        default:
            print("Default case.")
        }
        
        setupTextField()
    }
    
    func setupTextField() {
        // Adding to hierarchy
        self.view.addSubview(textField)
        
        // Adding constraints
        textField.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }

}
