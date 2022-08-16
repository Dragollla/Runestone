import UIKit

@available(iOS 14.0, *)
final class FloatingCaretView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = floor(bounds.width / 2)
    }
}
