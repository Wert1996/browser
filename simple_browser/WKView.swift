import SwiftUI
import WebKit

struct WKView: NSViewRepresentable {
    @ObservedObject var webViewStateModel: WebViewStateModel

    typealias NSViewType = WKWebView

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeNSView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        return webView
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        if let url = URL(string: webViewStateModel.pageTitle) {
            nsView.load(URLRequest(url: url))
        }
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: WKView

        init(_ parent: WKView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            if parent.webViewStateModel.goBack {
                webView.goBack()
                parent.webViewStateModel.goBack = false
            }
            if parent.webViewStateModel.goForward {
                webView.goForward()
                parent.webViewStateModel.goForward = false

            }
        }
    }
}
