//
//  CharacterListViewController.swift
//  CleanSwiftTest
//
//  Created by Ruslan Liulka on 02.05.2025.
//  Copyright (c) 2025 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CharacterListDisplayLogic: class
{
    func displaySomething(viewModel: CharacterList.FetchCharacter.ViewModel)
}

class CharacterListViewController: UIViewController, CharacterListDisplayLogic
{
    var interactor: CharacterListBusinessLogic?
    var router: (NSObjectProtocol & CharacterListRoutingLogic & CharacterListDataPassing)?
    
    private let tableView = UITableView()
    private var characters: [CharacterViewModel] = []
    
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        
        view.addSubview(tableView)
        
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = CharacterListInteractor()
        let presenter = CharacterListPresenter()
        let router = CharacterListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        setupTableView()
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        self.title = "Characters"
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Do something
    
    func doSomething()
    {
        let request = CharacterList.FetchCharacter.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: CharacterList.FetchCharacter.ViewModel)
    {
        characters = viewModel.viewModel
        print("Character \(characters)")
        tableView.reloadData()
    }
}

extension CharacterListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        //cell.textLabel?.text = characters[indexPath.row].name
        
        cell.configure(with: characters[indexPath.row])
        return cell
    }
    
    
}

extension CharacterListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCharacter = characters[indexPath.row]
        router?.dataStore?.characterId = selectedCharacter.id
        router?.routeToDetailsCharacter()
    }
}
