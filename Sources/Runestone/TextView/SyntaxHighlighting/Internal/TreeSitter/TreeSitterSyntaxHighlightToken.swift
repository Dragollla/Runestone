import UIKit

@available(iOS 14, *)
final class TreeSitterSyntaxHighlightToken {
    let range: NSRange
    let textColor: UIColor?
    let shadow: NSShadow?
    let font: UIFont?
    let fontTraits: FontTraits
    var isEmpty: Bool {
        return range.length == 0 || (textColor == nil && font == nil && shadow == nil)
    }

    init(range: NSRange, textColor: UIColor?, shadow: NSShadow?, font: UIFont?, fontTraits: FontTraits) {
        self.range = range
        self.textColor = textColor
        self.shadow = shadow
        self.font = font
        self.fontTraits = fontTraits
    }
}
@available(iOS 14.0, *)
extension TreeSitterSyntaxHighlightToken: Equatable {
    static func == (lhs: TreeSitterSyntaxHighlightToken, rhs: TreeSitterSyntaxHighlightToken) -> Bool {
        return lhs.range == rhs.range && lhs.textColor == rhs.textColor && lhs.font == rhs.font
    }
}
@available(iOS 14.0, *)
extension TreeSitterSyntaxHighlightToken {
    static func locationSort(_ lhs: TreeSitterSyntaxHighlightToken, _ rhs: TreeSitterSyntaxHighlightToken) -> Bool {
        if lhs.range.location != rhs.range.location {
            return lhs.range.location < rhs.range.location
        } else {
            return lhs.range.length < rhs.range.length
        }
    }
}
@available(iOS 14.0, *)
extension TreeSitterSyntaxHighlightToken: CustomDebugStringConvertible {
    var debugDescription: String {
        return "[TreeSitterSyntaxHighlightToken: \(range.location) - \(range.length)]"
    }
}
