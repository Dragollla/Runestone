import Foundation

/// A location in the text.
@available(iOS 14.0, *)
public struct TextLocation: Hashable, Equatable {
    /// Zero-based line number.
    public let lineNumber: Int
    /// Column in the line.
    public let column: Int

    init(_ linePosition: LinePosition) {
        self.lineNumber = linePosition.row
        self.column = linePosition.column
    }
}
