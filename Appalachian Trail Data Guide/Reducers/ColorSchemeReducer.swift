//
//  ColorSchemeReducer.swift
//  Appalachian Trail Data Guide
//
//  Created by Joseph Pecoraro on 4/29/17.
//  Copyright © 2017 Joseph Pecoraro. All rights reserved.
//

import Foundation
import ReSwift

func colorSchemeReducer(state: ColorScheme?, action: Action) -> ColorScheme {
    let state = state ?? ColorScheme()
    
    switch action {
    default:
        return state
    }
}
