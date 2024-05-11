//
//  WebViewStateModel.swift
//  simple_browser
//
//  Created by Anshumaan  Parashar on 08/05/24.
//

import Foundation


class WebViewStateModel: ObservableObject {
    @Published var pageTitle: String = "https://google.com"
    @Published var goToPage: Bool = false
    
    @Published var goBack: Bool = false
    @Published var goForward: Bool = false
}
