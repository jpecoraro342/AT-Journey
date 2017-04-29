//
//  TableViewControllerExtensions.swift
//  Gainz
//
//  Created by Joseph Pecoraro on 9/19/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        
        let Nib = UINib(nibName: T.NibName, bundle: nil)
        self.register(Nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerDefault<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let Nib = UINib(nibName: T.NibName, bundle: nil)
        self.register(Nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

extension UITableView {
    func isEmpty() -> Bool {
        for section in 0..<self.numberOfSections {
            if self.numberOfRows(inSection: section) > 0 {
                return false
            }
        }
        
        return true
    }
}
