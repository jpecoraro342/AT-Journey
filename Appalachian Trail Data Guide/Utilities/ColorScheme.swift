import UIKit

let blueLight = UIColor(hexString: "6FE7DD")
let blueLightDark = UIColor(hexString: "21c4b7")
let blue = UIColor(hexString: "3490DE")
let offWhite = UIColor(hexString: "fefefe")
let offBlack = UIColor(hexString: "090909")

let errorColor = UIColor(hexString: "cc0000")

let accentColor = blueLight
let darkAccentColor = blueLightDark

let darkTextColor = UIColor.darkGray

struct ColorScheme {
    let navBarColor = blue
    let navBarTintColor = offWhite
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
