import CoreGraphics
import Foundation

@available(iOS 14, *)
struct LineFragmentNodeID: RedBlackTreeNodeID {
    let id = UUID()
}

@available(iOS 14, *)
final class LineFragmentNodeData {
    var lineFragment: LineFragment?
    var lineFragmentHeight: CGFloat {
        return lineFragment?.scaledSize.height ?? 0
    }
    var totalLineFragmentHeight: CGFloat = 0

    init(lineFragment: LineFragment?) {
        self.lineFragment = lineFragment
    }
}
@available(iOS 14.0, *)
typealias LineFragmentNode = RedBlackTreeNode<LineFragmentNodeID, Int, LineFragmentNodeData>
@available(iOS 14.0, *)
extension LineFragmentNode {
    func updateTotalLineFragmentHeight() {
        data.totalLineFragmentHeight = previous.data.totalLineFragmentHeight + data.lineFragmentHeight
    }
}
