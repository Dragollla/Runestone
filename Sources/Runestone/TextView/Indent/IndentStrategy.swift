import Foundation

/// Strategy to use when indenting text.
@available(iOS 14.0, *)
public enum IndentStrategy: Equatable {
    /// Indent using tabs. The length specified length is used to determine the width of the tab measured in space characers.
    case tab(length: Int)
    /// Indent using a number of spaces.
    case space(length: Int)
}

@available(iOS 14.0, *)
extension IndentStrategy {
    var tabLength: Int {
        switch self {
        case .tab(let length):
            return length
        case .space(let length):
            return length
        }
    }

    func string(indentLevel: Int) -> String {
        switch self {
        case .tab:
            return String(repeating: Symbol.Character.tab, count: indentLevel)
        case .space(let length):
            return String(repeating: Symbol.Character.space, count: length * indentLevel)
        }
    }
}
