//
//  NavigationState.swift
//  anotherbrowser
//
//  Created by Anshumaan  Parashar on 01/06/24.
//

import Foundation
import SwiftUI
import WebKit

class NavigationState: NSObject, ObservableObject {
    @Published var currentURL: URL?
    @Published var webViews: [WKWebView] = []
    @Published var selectedWebView: WKWebView?
    
    @discardableResult func createNewWebView(withRequest request: URLRequest) -> WKWebView {
        let wv = WKWebView()
        wv.navigationDelegate = self
        DispatchQueue.main.async {
            wv.load(request)
            self.webViews.append(wv)
            self.selectedWebView = wv
            self.currentURL = wv.url
        }
        return wv
    }
}


extension NavigationState: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        if webView == selectedWebView {
            self.currentURL = webView.url
        }
    }
}
