//
//  ShelterReducer.swift
//  Appalachian Trail Data Guide
//
//  Created by Joseph Pecoraro on 4/29/17.
//  Copyright © 2017 Joseph Pecoraro. All rights reserved.
//

import Foundation
import ReSwift

func shelterReducer(state: [ShelterGroup]?, action: Action) -> [ShelterGroup] {
    var state = state ?? []
    
    switch action {
    case let action as SetShelters:
        state.append(contentsOf: action.shelters)
        return state
    default:
        return state
    }
}
