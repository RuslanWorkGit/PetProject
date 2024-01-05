//
//  VaccinationTableViewController.swift
//  MedTrack
//
//  Created by Ruslan Liulka on 24.12.2023.
//

import UIKit
import CoreData

class VaccinationTableViewController: UITableViewController {
    var vaccinations: [Vaccination] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadVaccinations()
        
    }
    
    func loadVaccinations() {
            // Завантаження даних про вакцинації з CoreData
        }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
