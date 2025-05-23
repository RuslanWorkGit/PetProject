//
//  CatalogListPresenter.swift
//  TestCleanSwift
//
//  Created by Ruslan Liulka on 29.04.2025.
//  Copyright (c) 2025 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CatalogListPresentationLogic
{
    func presentCatalog(response: CharacterList.FetchCharacter.Response)
}

class CatalogListPresenter: CatalogListPresentationLogic
{
    weak var viewController: CatalogListDisplayLogic?
    
    // MARK: Do Catalog
    
    func presentCatalog(response: CharacterList.FetchCharacter.Response)
    {
        
        let rows = response.characters.map { character in
            return CharacterList.CharacterDisplay(id: character.id, name: character.name, status: character.status, species: character.species, gender: character.gender, imageURL: character.image)
        }

//        let rows = response.products.map { character in
//            return ViewModelProduct(id: character.id, title: character.name, description: character.gender, imageUrl: character.image)
//        }
        
        let viewModel = CharacterList.FetchCharacter.ViewModel(displayCharacter: rows)
        viewController?.displayCatalog(viewModel: viewModel)
    }
}
