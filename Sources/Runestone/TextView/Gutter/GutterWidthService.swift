import Combine
import UIKit

@available(iOS 14.0, *)
public final class GutterWidthService {
    var lineManager: LineManager {
        didSet {
            if lineManager !== oldValue {
                _lineNumberWidth = nil
            }
        }
    }
    var font = UIFont.monospacedSystemFont(ofSize: 14, weight: .regular) {
        didSet {
            if font != oldValue {
                _lineNumberWidth = nil
            }
        }
    }
    var showLineNumbers = false {
        didSet {
            if showLineNumbers != oldValue {
                sendGutterWidthUpdatedIfNeeded()
            }
        }
    }
    var gutterLeadingPadding: CGFloat = 0
    var gutterTrailingPadding: CGFloat = 0
    var gutterWidth: CGFloat {
        if showLineNumbers {
            return lineNumberWidth + gutterLeadingPadding + gutterTrailingPadding
        } else {
            return 0
        }
    }
    var lineNumberWidth: CGFloat {
        let lineCount = lineManager.lineCount
        let hasLineCountChanged = lineCount != previousLineCount
        let hasFontChanged = font != previousFont
        if let lineNumberWidth = _lineNumberWidth, !hasLineCountChanged && !hasFontChanged {
            return lineNumberWidth
        } else {
            let lineNumberWidth = computeLineNumberWidth()
            _lineNumberWidth = lineNumberWidth
            previousFont = font
            previousLineCount = lineManager.lineCount
            sendGutterWidthUpdatedIfNeeded()
            return lineNumberWidth
        }
    }
    let didUpdateGutterWidth = PassthroughSubject<Void, Never>()

    private var _lineNumberWidth: CGFloat?
    private var previousLineCount = 0
    private var previousFont: UIFont?
    private var previouslySentGutterWidth: CGFloat?

    public init(lineManager: LineManager) {
        self.lineManager = lineManager
    }

    func invalidateLineNumberWidth() {
        _lineNumberWidth = nil
    }
}

@available(iOS 14.0, *)
private extension GutterWidthService {
    private func computeLineNumberWidth() -> CGFloat {
        let characterCount = "\(lineManager.lineCount)".count
        let wideLineNumberString = String(repeating: "8", count: characterCount)
        let wideLineNumberNSString = wideLineNumberString as NSString
        let size = wideLineNumberNSString.size(withAttributes: [.font: font])
        return ceil(size.width)
    }

    private func sendGutterWidthUpdatedIfNeeded() {
        if gutterWidth != previouslySentGutterWidth {
            didUpdateGutterWidth.send()
            previouslySentGutterWidth = gutterWidth
        }
    }
}
