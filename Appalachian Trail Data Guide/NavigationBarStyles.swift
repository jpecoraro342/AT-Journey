//
//  NavigationBarStyles.swift
//  Appalachian Trail Data Guide
//
//  Created by Joseph Pecoraro on 4/29/17.
//  Copyright © 2017 Joseph Pecoraro. All rights reserved.
//

import UIKit
import ReSwift

extension UINavigationBar {
    func updateStyles(state: ColorScheme) {
        barTintColor = state.navBarColor
        tintColor = state.navBarTintColor
        titleTextAttributes = [NSForegroundColorAttributeName : state.navBarTintColor]
        
        isTranslucent = false
    }
}

func styleNavigationController(_ navController: UINavigationController, state: ColorScheme) {
    navController.navigationBar.tintColor = state.navBarColor
    navController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : state.navBarTintColor]
    
    navController.navigationBar.isTranslucent = false
}
