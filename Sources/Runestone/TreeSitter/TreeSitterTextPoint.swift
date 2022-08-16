import TreeSitter
@available(iOS 14.0, *)
final class TreeSitterTextPoint {
    var row: UInt32 {
        return rawValue.row
    }
    var column: UInt32 {
        return rawValue.column
    }

    let rawValue: TSPoint

    init(_ point: TSPoint) {
        self.rawValue = point
    }

    init(row: UInt32, column: UInt32) {
        self.rawValue = TSPoint(row: row, column: column)
    }
}
@available(iOS 14.0, *)
extension TreeSitterTextPoint: CustomDebugStringConvertible {
    var debugDescription: String {
        return "[TreeSitterTextPoint row=\(row) column=\(column)]"
    }
}
