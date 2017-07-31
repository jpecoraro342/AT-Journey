//
//  ShelterActions.swift
//  Appalachian Trail Data Guide
//
//  Created by Joseph Pecoraro on 4/29/17.
//  Copyright © 2017 Joseph Pecoraro. All rights reserved.
//

import Foundation
import ReSwift

func fetchShelters(state: State, store: Store<State>) -> Action? {
    if state.shelters.count != 0 {
        log.debug("Shelters already initialized, no need to refetch")
        return nil
    }
    
    let parser = JsonShelterParser(filePath: ShelterFilePath)
    store.dispatch(SetShelters(shelters: parser.parse()))
    
    return nil
}

struct SetShelters: Action {
    let shelters: [ShelterGroup]
}
