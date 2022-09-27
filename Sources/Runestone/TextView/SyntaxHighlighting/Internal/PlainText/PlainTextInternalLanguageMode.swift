import Foundation

@available(iOS 14.0, *)
public final class PlainTextInternalLanguageMode: InternalLanguageMode {
    
  public init() {}
    
    public func parse(_ text: NSString) {}

    public func parse(_ text: NSString, completion: @escaping ((Bool) -> Void)) {
        completion(true)
    }

    public func textDidChange(_ change: TextChange) -> LineChangeSet {
        return LineChangeSet()
    }

    func tokenType(at location: Int) -> String? {
        return nil
    }

    public func createLineSyntaxHighlighter() -> LineSyntaxHighlighter {
        return PlainTextSyntaxHighlighter()
    }

    func highestSyntaxNode(at linePosition: LinePosition) -> SyntaxNode? {
        return nil
    }

    public func syntaxNode(at linePosition: LinePosition) -> SyntaxNode? {
        return nil
    }

    public func currentIndentLevel(of line: DocumentLineNode, using indentStrategy: IndentStrategy) -> Int {
        return 0
    }

    public func strategyForInsertingLineBreak(
        from startLinePosition: LinePosition,
        to endLinePosition: LinePosition,
        using indentStrategy: IndentStrategy) -> InsertLineBreakIndentStrategy {
        return InsertLineBreakIndentStrategy(indentLevel: 0, insertExtraLineBreak: false)
    }

    public func detectIndentStrategy() -> DetectedIndentStrategy {
        return .unknown
    }
}
