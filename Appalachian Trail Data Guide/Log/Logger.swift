import Foundation

protocol Logger {
    func verbose(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int)
    func debug(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int)
    func info(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int)
    func warning(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int)
    func error(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int)
}

extension Logger {
    func verbose(_ message: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        verbose(message, file, function, line: line)
    }
    
    func debug(_ message: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        debug(message, file, function, line: line)
    }
    
    func info(_ message: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        info(message, file, function, line: line)
    }
    
    func warning(_ message: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        warning(message, file, function, line: line)
    }
    
    func error(_ message: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, line: Int = #line) {
        error(message, file, function, line: line)
    }
}

class PrintLogger : Logger {
    func verbose(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int) {
        print("VERBOSE – \(fileName(file)).\(function):\(line) – \(message())")
    }
    
    func debug(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int) {
        print("DEBUG – \(fileName(file)).\(function):\(line) – \(message())")
    }
    
    func info(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int) {
        print("INFO – \(fileName(file)).\(function):\(line) – \(message())")
    }
    
    func warning(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int) {
        print("WARNING – \(fileName(file)).\(function):\(line) – \(message())")
    }
    
    func error(_ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int) {
        print("ERROR – \(fileName(file)).\(function):\(line) – \(message())")
    }
    
    private func fileName(_ file: String) -> String {
        return URL(fileURLWithPath: file).lastPathComponent
    }
}
