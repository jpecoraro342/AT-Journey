//
//  ShelterCell.swift
//  Appalachian Trail Data Guide
//
//  Created by Joseph Pecoraro on 4/29/17.
//  Copyright © 2017 Joseph Pecoraro. All rights reserved.
//

import UIKit

class ShelterCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureWithShelter(shelter: Shelter) {
        textLabel?.text = "\(shelter.name) | \(shelter.elevation)ft"
        detailTextLabel?.text = "\(shelter.springerDistance)mi"
    }
    
    func configureWithShelter(shelter: Shelter, previousShelter: Shelter) {
        textLabel?.text = "\(shelter.name)  \(shelter.elevation)ft"
        detailTextLabel?.text = "\((shelter.springerDistance - previousShelter.springerDistance).roundToDecimal(2))mi, " +
            "elevation change: \(shelter.elevation - previousShelter.elevation)ft"
    }
}

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}

extension ShelterCell: ReusableView { }
