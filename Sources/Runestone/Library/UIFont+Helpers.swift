import UIKit

public extension UIFont {
    var totalLineHeight: CGFloat {
        return ascender + abs(descender) + leading
    }
}
