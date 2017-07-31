//
//  NavigationControllerHelper.swift
//  Appalachian Trail Data Guide
//
//  Created by Joseph Pecoraro on 4/29/17.
//  Copyright © 2017 Joseph Pecoraro. All rights reserved.
//

import UIKit
import ReSwift

func navControllerEmbeddedVC(_ viewController: UIViewController) -> UINavigationController {
    let navController = UINavigationController(rootViewController: viewController)
    navController.navigationBar.updateStyles(state: store.state.colorScheme)
    
    return navController
}
