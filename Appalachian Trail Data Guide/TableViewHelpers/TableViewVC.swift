//
//  TableViewVC.swift
//  Gainz
//
//  Created by Joseph Pecoraro on 2/12/17.
//  Copyright © 2017 Joseph Pecoraro. All rights reserved.
//

import UIKit

protocol TableViewVC {
    var tableView: UITableView { get }
    var vc: UIViewController { get }
}

extension TableViewVC where Self: UIViewController {
    var vc: UIViewController { return self }
}
