import UIKit

var str = "Hello, playground"

protocol ShapePrinter {
    var width: Int { get }
    var height: Int { get }
    
    func printIt()
    func printStar(x: Int, y: Int) -> Bool
}


class RectanglePrinter: ShapePrinter {
    var height: Int
    var width: Int
    
    init(width: Int, height: Int) {
        self.height = height
        self.width = width
    }
    
    func printIt() {
        for y in 1..<(height+1) {
            for x in 1..<(width + 1) {
                printStar(x: x, y: y)  ? print("*", terminator: " ") : print("  ", terminator: "")
            }
            print()
        }
    }

    func printStar(x: Int, y: Int) -> Bool {
        return true
    }
}

class TrianglePrinter: ShapePrinter {
    var height: Int
    var width: Int
    var separator: Int
    
    init(width: Int, height: Int) {
        self.height = height
        self.width = width
        self.separator = width / 2 + width % 2
    }
    
    func printIt() {
        for y in 1..<(height+1) {
            for x in 1..<(width + 1) {
                printStar(x: x, y: y)  ? print("*", terminator: " ") : print("  ", terminator: "")
            }
            print()
        }
    }
    
    func printStar(x: Int, y: Int) -> Bool {
        if (x <= separator) {
            return  x + y > separator
        } else {
            return  separator - x + y > 0
        }
    }
}

class DiamondPrinter: ShapePrinter {
    var height: Int
    var width: Int
    var separator: Int
    var heightSeparator: Int
    
    init(width: Int, height: Int) {
        self.height = height
        self.width = width
        self.separator = width / 2 + width % 2
        self.heightSeparator = height / 2 + height % 2
    }
    
    func printIt() {
        for y in 1..<(height+1) {
            for x in 1..<(width + 1) {
                printStar(x: x, y: y)  ? print("*", terminator: " ") : print("  ", terminator: "")
            }
            print()
        }
    }
    
    func printStar(x: Int, y: Int) -> Bool {
        var printable: Bool = false
        if (y <= heightSeparator ) {
            if (x <= separator) {
                printable =  x + y - separator > 0
            } else {
                printable = separator - x + y > 0
            }
        } else {
            if (x <= separator) {
                printable =  x - y + heightSeparator > 0
            } else {
                printable = x - width + (y - heightSeparator) <= 0
            }
        }
        return printable
    }
}

RectanglePrinter(width: 6, height: 9).printIt()
TrianglePrinter(width: 10, height: 5).printIt()
DiamondPrinter(width: 9, height: 9).printIt()

