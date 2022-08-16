import Foundation

/// Node in the syntax tree.
@available(iOS 14.0, *)
public struct SyntaxNode: Equatable, Hashable {
    /// Type of the node. Values depend on the language.
    ///
    /// The values depend on the language used in the text view. Examples include `string`, `number` and `identifier`.
    public let type: String
    /// Location at which the node starts.
    public let startLocation: TextLocation
    /// Location at which the node ends.
    public let endLocation: TextLocation
}
