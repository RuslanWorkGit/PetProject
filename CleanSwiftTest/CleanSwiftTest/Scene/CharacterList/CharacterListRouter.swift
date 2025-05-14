

import UIKit

@objc protocol CharacterListRoutingLogic
{
    func routeToDetailsCharacter()
}

protocol CharacterListDataPassing
{
    var dataStore: CharacterListDataStore? { get set }
}

class CharacterListRouter: NSObject, CharacterListRoutingLogic, CharacterListDataPassing
{

    weak var viewController: CharacterListViewController?
    var dataStore: CharacterListDataStore?
    
    
    func routeToDetailsCharacter() {
//        let destinationVC = CharacterDetailsViewController()
//        let destinationRouter = CharacterDetailsRouter()
//        destinationVC.router = destinationRouter
//        destinationRouter.viewController = destinationVC
//        destinationRouter.dataStore = CharacterDetailsInteractor()
//        
//        if var destinationDS = destinationRouter.dataStore {
//            destinationDS.characterId = dataStore?.characterId
//        }
//        
//        viewController?.navigationController?.pushViewController(destinationVC, animated: true)
        
        let destinationVC = CharacterDetailsViewController()
        if var destinationDS = destinationVC.router?.dataStore {
            destinationDS.characterId = dataStore?.characterId
        }
        viewController?.navigationController?.pushViewController(destinationVC, animated: true)

    }
}
