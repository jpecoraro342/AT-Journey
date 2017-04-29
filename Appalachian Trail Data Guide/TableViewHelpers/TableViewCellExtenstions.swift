//
//  TableViewCellExtenstions.swift
//  Gainz
//
//  Created by Joseph Pecoraro on 9/19/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {
    static var NibName: String {
        return String(describing: self)
    }
}

protocol ReusableView: class { }

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
