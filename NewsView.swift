//
//  NewsView.swift
//  SimpleNewsViewer
//
//  Created by Kai Jing on 3/5/20.
//  Copyright © 2020 Kai Jing. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI

struct NewsView: View {

    let url: String?

    var body: some View {
        WebView(urlString: url)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(url: "https://www.google.com")
    }
}

struct WebView: UIViewRepresentable {

    let urlString: String?

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
