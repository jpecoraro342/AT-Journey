//
//  State.swift
//  Appalachian Trail Data Guide
//
//  Created by Joseph Pecoraro on 4/29/17.
//  Copyright © 2017 Joseph Pecoraro. All rights reserved.
//

import ReSwift

let store = Store<State>(reducer: AppReducer(), state: nil)

struct State: StateType {
    var shelters: [ShelterGroup]
    var colorScheme: ColorScheme
}
