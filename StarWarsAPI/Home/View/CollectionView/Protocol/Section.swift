//
//  Section.swift
//  StarWarsAPI
//
//  Created by Eric Morales on 9/17/21.
//

import UIKit

protocol Section {
    var numberOfItems: Int { get }
    
    func layoutSection() -> NSCollectionLayoutSection?
    
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
