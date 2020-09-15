//
//  CustomWebView.swift
//  HackerNewsApp-SwiftUI
//
//  Created by Gustavo Lozano on 14/09/20.
//  Copyright © 2020 gustavo.lozano. All rights reserved.
//

import SwiftUI
import WebKit

struct CustomWebView: View {
    let url: String
    
    var body: some View {
        WebView(urlString: url)
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

struct CustomWebView_Previews: PreviewProvider {
    static var previews: some View {
        CustomWebView(url: "https://www.google.com")
    }
}
