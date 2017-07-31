//
//  ShelterListVC.swift
//  Appalachian Trail Data Guide
//
//  Created by Joseph Pecoraro on 4/29/17.
//  Copyright © 2017 Joseph Pecoraro. All rights reserved.
//

import Foundation
import ReSwift
import UIKit

class ShelterListVC : UIViewController, TableViewVC, StoreSubscriber {
    let tableView = UITableView(frame: .zero, style: .grouped)
    var shelters: [ShelterGroup] = []
    
    override func viewDidLoad() {
        navigationItem.title = "AT Waypoints"
        setupTableView()
        
        store.dispatch(fetchShelters)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        store.subscribe(self) { state in
            state.shelters
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        store.unsubscribe(self)
    }
    
    func setupTableView() {
        tableView.fullScreenLayout(superview: view)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 55
        
        tableView.registerDefault(ShelterCell.self)
    }
    
    func newState(state: [ShelterGroup]) {
        log.info("Shelter State Updated - Shelter Group Count: \(state.count)")
        
        shelters = state
        tableView.reloadData()
    }
    
    func previousShelter(section: Int, row: Int) -> Shelter? {
        if (row == 0 && section == 0) {
            return nil
        }
        
        if (row == 0) {
            return shelters[section - 1].shelters.last
        }
        
        return shelters[section].shelters[row - 1]
    }
}

extension ShelterListVC : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return shelters.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return shelters[section].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shelters[section].shelters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ShelterCell
        
        let shelter = shelters[indexPath.section].shelters[indexPath.row]
        
        if let previousShelter = previousShelter(section: indexPath.section, row: indexPath.row) {
            cell.configureWithShelter(shelter: shelter, previousShelter: previousShelter)
        }
        else {
            cell.configureWithShelter(shelter: shelter)
        }
        
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return [
        "GA",
        "NC",
        "TN",
        "VA",
        "VA",
        "VA",
        "WV",
        "PA",
        "NJ",
        "NY",
        "CT",
        "MA",
        "VT",
        "NH",
        "MA",
        "MA"
        ]
    }
}

extension ShelterListVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
