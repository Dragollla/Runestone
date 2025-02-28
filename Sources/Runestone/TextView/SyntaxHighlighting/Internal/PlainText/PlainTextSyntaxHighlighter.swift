import CoreGraphics
import Foundation

@available(iOS 14.0, *)
final class PlainTextSyntaxHighlighter: LineSyntaxHighlighter {
    var theme: Theme = DefaultTheme()
    var kern: CGFloat = 0
    var canHighlight: Bool {
        return false
    }

    func syntaxHighlight(_ input: LineSyntaxHighlighterInput) {}

    func syntaxHighlight(_ input: LineSyntaxHighlighterInput, completion: @escaping AsyncCallback) {
        return completion(.success(()))
    }

    func cancel() {}
}
