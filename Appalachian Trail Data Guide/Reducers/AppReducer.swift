//
//  AppReducer.swift
//  Appalachian Trail Data Guide
//
//  Created by Joseph Pecoraro on 4/29/17.
//  Copyright © 2017 Joseph Pecoraro. All rights reserved.
//

import ReSwift

struct AppReducer: Reducer {
    func handleAction(action: Action, state: State?) -> State {
        return State(
            shelters: shelterReducer(state: state?.shelters, action: action),
            colorScheme: colorSchemeReducer(state: state?.colorScheme, action: action)
        )
    }
}
