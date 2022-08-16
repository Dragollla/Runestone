import Foundation
@available(iOS 14.0, *)
class RedBlackTreeChildrenUpdater<NodeID: RedBlackTreeNodeID, NodeValue: RedBlackTreeNodeValue, NodeData> {
    typealias Node = RedBlackTreeNode<NodeID, NodeValue, NodeData>

    func updateAfterChangingChildren(of node: Node) -> Bool {
        return false
    }
}
