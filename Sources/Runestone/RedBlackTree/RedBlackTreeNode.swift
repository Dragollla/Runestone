import Foundation

@available(iOS 14.0, *)
public protocol RedBlackTreeNodeID: Identifiable, Hashable {
    init()
}

public typealias RedBlackTreeNodeValue = Comparable & AdditiveArithmetic

@available(iOS 14.0, *)
public final class RedBlackTreeNode<NodeID: RedBlackTreeNodeID, NodeValue: RedBlackTreeNodeValue, NodeData> {
    typealias Tree = RedBlackTree<NodeID, NodeValue, NodeData>

    let id = NodeID()
    var nodeTotalValue: NodeValue
    var nodeTotalCount: Int
    var location: NodeValue {
        return tree.location(of: self)
    }
    var value: NodeValue
    var index: Int {
        return tree.index(of: self)
    }
    var left: RedBlackTreeNode?
    var right: RedBlackTreeNode?
    weak var parent: RedBlackTreeNode?
    var color: RedBlackTreeNodeColor = .black
    let data: NodeData
    var tree: Tree {
        if let tree = _tree {
            return tree
        } else {
            fatalError("Accessing tree after it has been deallocated.")
        }
    }

    private weak var _tree: Tree?

    init(tree: Tree, value: NodeValue, data: NodeData) {
        self._tree = tree
        self.nodeTotalCount = 1
        self.nodeTotalValue = value
        self.value = value
        self.data = data
    }
}
@available(iOS 14.0, *)
extension RedBlackTreeNode {
    var leftMost: RedBlackTreeNode {
        var node = self
        while let newNode = node.left {
            node = newNode
        }
        return node
    }
    var rightMost: RedBlackTreeNode {
        var node = self
        while let newNode = node.right {
            node = newNode
        }
        return node
    }
    var previous: RedBlackTreeNode {
        if let left = left {
            return left.rightMost
        } else {
            var oldNode = self
            var node = parent ?? self
            while let parent = node.parent, node.left === oldNode {
                oldNode = node
                node = parent
            }
            return node
        }
    }
    var next: RedBlackTreeNode {
        if let right = right {
            return right.leftMost
        } else {
            var oldNode = self
            var node = parent ?? self
            while let parent = node.parent, node.right === oldNode {
                oldNode = node
                node = parent
            }
            return node
        }
    }
}
@available(iOS 14.0, *)
extension RedBlackTreeNode: Hashable {
    public static func == (lhs: RedBlackTreeNode<NodeID, NodeValue, NodeData>, rhs: RedBlackTreeNode<NodeID, NodeValue, NodeData>) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
@available(iOS 14.0, *)
extension RedBlackTreeNode where NodeData == Void {
    convenience init(tree: Tree, value: NodeValue) {
        self.init(tree: tree, value: value, data: ())
    }
}
@available(iOS 14.0, *)
extension RedBlackTreeNode: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "[RedBlackTreeNode index=\(index) location=\(location) nodeTotalCount=\(nodeTotalCount)]"
    }
}
