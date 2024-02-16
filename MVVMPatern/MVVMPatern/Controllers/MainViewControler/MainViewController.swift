//
//  MainViewController.swift
//  MVVMPatern
//
//  Created by Ruslan Liulka on 14.02.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    //@IBoutlets
    @IBOutlet weak var tableView: UITableView!
    
    //ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        
    }
    
    func configView() {
        self.title = "Main View"
        self.view.backgroundColor = .red
        
        setupTableView()
    }


}
