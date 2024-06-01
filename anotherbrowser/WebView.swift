import SwiftUI
import WebKit


struct WebView: NSViewRepresentable {
    
    @ObservedObject var navigationState: NavigationState
    
    func makeNSView(context: Context) -> NSView  {
        return NSView()
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {
        guard let webView = navigationState.selectedWebView else {
            return
        }
        if webView != nsView.subviews.first as? WKWebView {
            nsView.subviews.forEach { $0.removeFromSuperview() }
            
            // Correct frame setting for macOS
            webView.translatesAutoresizingMaskIntoConstraints = false
            webView.frame = nsView.frame
            nsView.addSubview(webView)

            NSLayoutConstraint.activate([
                webView.leadingAnchor.constraint(equalTo: nsView.leadingAnchor),
                webView.trailingAnchor.constraint(equalTo: nsView.trailingAnchor),
                webView.topAnchor.constraint(equalTo: nsView.topAnchor),
                webView.bottomAnchor.constraint(equalTo: nsView.bottomAnchor)
            ])
        }
    }
}
