import TreeSitter

@available(iOS 14.0, *)
final class TreeSitterTextRange {
    let rawValue: TSRange
    var startPoint: TreeSitterTextPoint {
        return TreeSitterTextPoint(row: rawValue.start_point.row, column: rawValue.start_point.column)
    }
    var endPoint: TreeSitterTextPoint {
        return TreeSitterTextPoint(row: rawValue.end_point.row, column: rawValue.end_point.column)
    }
    var startByte: ByteCount {
        return ByteCount(rawValue.start_byte)
    }
    var endByte: ByteCount {
        return ByteCount(rawValue.end_byte)
    }

    init(startPoint: TreeSitterTextPoint, endPoint: TreeSitterTextPoint, startByte: ByteCount, endByte: ByteCount) {
        self.rawValue = TSRange(
            start_point: startPoint.rawValue,
            end_point: endPoint.rawValue,
            start_byte: UInt32(startByte.value),
            end_byte: UInt32(endByte.value))
    }
}
@available(iOS 14.0, *)
extension TreeSitterTextRange: CustomDebugStringConvertible {
    var debugDescription: String {
        return "[TreeSitterTextRange startByte=\(startByte) endByte=\(endByte) startPoint=\(startPoint) endPoint=\(endPoint)]"
    }
}
