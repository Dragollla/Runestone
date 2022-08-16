import Foundation

/// Approach for highlighting the selected line.
@available(iOS 14, *)
public enum LineSelectionDisplayType {
    /// Do not highlight the selected line.
    case disabled
    /// Highlight the entire selected line.
    case line
    /// Only highlight the selected line fragment. A line may span multiple line fragments if line wrapping is enabled.
    case lineFragment
}
@available(iOS 14, *)
extension LineSelectionDisplayType {
    var shouldShowLineSelection: Bool {
        switch self {
        case .disabled:
            return false
        case .line, .lineFragment:
            return true
        }
    }
}
