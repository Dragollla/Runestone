import UIKit

@available(iOS 14.0, *)
enum Caret {
    static let width: CGFloat = 2

    static func defaultHeight(for font: UIFont?) -> CGFloat {
        return font?.lineHeight ?? 15
    }
}
