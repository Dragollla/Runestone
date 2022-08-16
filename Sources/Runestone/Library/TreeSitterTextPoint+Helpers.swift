import Foundation
@available(iOS 14.0, *)
extension TreeSitterTextPoint {
    convenience init(_ linePosition: LinePosition) {
        let row = UInt32(linePosition.row)
        let column = UInt32(linePosition.column * 2)
        self.init(row: row, column: column)
    }
}
