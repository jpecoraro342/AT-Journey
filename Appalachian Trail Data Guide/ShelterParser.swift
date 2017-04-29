//
//  ShelterParser.swift
//  Appalachian Trail Data Guide
//
//  Created by Joseph Pecoraro on 7/30/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit

protocol ShelterParser {
    func parse() -> [State]
}

class JsonShelterParser: NSObject, ShelterParser {
    let path: String
    
    init(filePath: String) {
        path = filePath
    }
    
    func parse() -> [State] {
        var states = [State]()
        
        do {
            let json = try JSONSerialization.jsonObject(with: Data(contentsOf: URL(fileURLWithPath: self.path)), options: []) as! [Dictionary<String, AnyObject>]
            
            states = json.map({ self.getState($0) })
        }
        catch {
            return states
        }
        return states
    }
    
    fileprivate func getState(_ attributes: Dictionary<String, AnyObject>) -> State {
        let name = attributes["section"] as! String
        var shelters = [Shelter]()
        
        if let shelterArr = attributes["shelters"] as? [Dictionary<String, AnyObject>] {
            shelters = shelterArr.map({ self.getShelter($0) })
        }
        
        return State(shelters: shelters, name: name)
    }

    fileprivate func getShelter(_ attributes: Dictionary<String, AnyObject>) -> Shelter {
        let name = attributes["name"] as! String
        let elevation = Double(attributes["elevation"] as! String)!
        let springerDistance = Double(attributes["springdist"] as! String)!
        let amenities = attributes["amenities"] as! String
        
        var links = [Link]()
        
        if let linkArr = attributes["links"] as? [Dictionary<String, String>] {
            links = linkArr.map({ self.getLink($0) })
        }
    
        return Shelter(name: name, elevation: elevation, springerDistance: springerDistance, amenities: amenities, links: links)
    }
    
    fileprivate func getLink(_ attributes: Dictionary<String, String>) -> Link {
        let label = attributes["label"]!
        let link = attributes["link"]!
        
        return Link(label: label, link: link)
    }
}
