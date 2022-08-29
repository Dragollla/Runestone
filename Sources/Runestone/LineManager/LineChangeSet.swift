import Foundation
@available(iOS 14.0, *)
public final class LineChangeSet {
    private(set) var insertedLines: Set<DocumentLineNode> = []
    private(set) var removedLines: Set<DocumentLineNode> = []
    private(set) var editedLines: Set<DocumentLineNode> = []

    func markLineInserted(_ line: DocumentLineNode) {
        removedLines.remove(line)
        editedLines.remove(line)
        insertedLines.insert(line)
    }

    func markLineRemoved(_ line: DocumentLineNode) {
        insertedLines.remove(line)
        editedLines.remove(line)
        removedLines.insert(line)
    }

    func markLineEdited(_ line: DocumentLineNode) {
        if !insertedLines.contains(line) && !removedLines.contains(line) {
            editedLines.insert(line)
        }
    }

    func union(with otherChangeSet: LineChangeSet) {
        insertedLines.formUnion(otherChangeSet.insertedLines)
        removedLines.formUnion(otherChangeSet.removedLines)
        editedLines.formUnion(otherChangeSet.editedLines)
    }
}
@available(iOS 14.0, *)
extension LineChangeSet: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "[LineChangeSet insertedLines=\(insertedLines) removedLines=\(removedLines) editedLines=\(editedLines)]"
    }
}
