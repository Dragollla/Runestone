import UIKit

@available(iOS 14.0, *)
final class IndexedPosition: UITextPosition {
    let index: Int

    init(index: Int) {
        self.index = index
    }
}
