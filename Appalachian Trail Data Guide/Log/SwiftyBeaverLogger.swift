//
//  SwiftyBeaverLogger.swift
//  Appalachian Trail Data Guide
//
//  Created by Joseph Pecoraro on 4/29/17.
//  Copyright © 2017 Joseph Pecoraro. All rights reserved.
//

import SwiftyBeaver

class SwiftyBeaverLogger : Logger {
    let log = SwiftyBeaver.self
    
    init() {
        let console = ConsoleDestination()
        console.format = "$DHH:mm:ss.SSS$d $L $N.$F:$l - $M"
        console.minLevel = .debug
        log.addDestination(console)
    }
    
    func verbose(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int) {
        log.verbose(message, file, function, line: line)
    }
    
    func debug(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int) {
        log.debug(message, file, function, line: line)
    }
    
    func info(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int) {
        log.info(message, file, function, line: line)
    }
    
    func warning(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int) {
        log.warning(message(), file, function, line: line)
    }
    
    func error(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int) {
        log.error(message, file, function, line: line)
    }
}
