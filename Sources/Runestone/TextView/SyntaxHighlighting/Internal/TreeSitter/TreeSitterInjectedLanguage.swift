import Foundation

@available(iOS 14.0, *)
struct TreeSitterInjectedLanguage {
    let id: UnsafeRawPointer
    let languageName: String
    let textRange: TreeSitterTextRange
}
