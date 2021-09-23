//
//  CategoryCell.swift
//  StarWarsAPI
//
//  Created by Eric Morales on 9/19/21.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    // MARK: Properties
    static var identifier: String = "CategoryCell"
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fill
        stack.alignment = .center
        stack.backgroundColor = .systemGray4
        stack.layer.cornerRadius = 8
        stack.layer.masksToBounds = true
        
        return stack
    }()
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .systemGray
        
        return image
    }()
    lazy var cellTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        
        return label
    }()
    

    
    // MARK: Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        // MARK: Add views to hierarchy
        self.addSubview(stackView)
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(cellTitle)
        
 
        // MARK: Constraints
        stackView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, constant: -20).isActive = true
        
        
        image.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.5).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20).isActive = true
        
        
        
    }
    

    
    func setContent(category: (Category, imageName) ) {
        cellTitle.text = category.0.displayName()
        image.image = UIImage(systemName: category.1.rawValue)
    }
}

