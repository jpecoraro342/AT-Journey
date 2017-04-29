//
//  Appalachian_Trail_Data_GuideTests.swift
//  Appalachian Trail Data GuideTests
//
//  Created by Joseph Pecoraro on 7/30/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import XCTest
@testable import Appalachian_Trail_Data_Guide

class JsonShelterParserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testJsonShelterParserLoadsAllStates() {
        let sectionCount = 16
        
        let parser = JsonShelterParser(filePath: ShelterFilePath)
        XCTAssertTrue(parser.parse().count == sectionCount, "Improper number of states")
    }
    
    func testStateLoadsProperly() {
        let parser = JsonShelterParser(filePath: ShelterFilePath)
        var states = parser.parse();
        XCTAssertTrue(states[0].name == "Georgia", "State has wrong name")
    }
    
    func testShelterLoadsProperly() {
        let parser = JsonShelterParser(filePath: ShelterFilePath)
        var states = parser.parse();
        let shelter = states[0].shelters[0]
        
        XCTAssertTrue(shelter.name == " Springer Mt. ", "Improper shelter name")
        XCTAssertTrue(shelter.amenities == " None ", "Improper shelter amenities")
        XCTAssertTrue(shelter.elevation == 3782, "Shelter elevation inaccurate - \(shelter.elevation)")
        XCTAssertTrue(shelter.springerDistance == 0, "Shelter is not proper distance from springer")
        XCTAssertTrue(shelter.links[0].link == "http://www.summitpost.org/mountain/rock/151895/springer-mountain.html", "Shelter does not have the right link")
    }
    
    func testJsonShelterParserPerformance() {
        self.measure {
            let parser = JsonShelterParser(filePath: ShelterFilePath)
            parser.parse()
        }
    }
    
}
