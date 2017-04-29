//
//  ShelterDataModel.swift
//  Appalachian Trail Data Guide
//
//  Created by Joseph Pecoraro on 7/30/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit

class ShelterDataModel: NSObject {
    let states: [State]
    
    init(parser: ShelterParser) {
        states = parser.parse()
    }
}

struct State {
    let shelters: [Shelter]
    let name: String
}

struct Shelter {
    let name: String
    let elevation: Double
    let springerDistance: Double
    let amenities: String
    let links: [Link]
}

struct Link {
    let label: String
    let link: String
}
