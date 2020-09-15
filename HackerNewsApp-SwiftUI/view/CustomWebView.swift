//
//  CustomWebView.swift
//  HackerNewsApp-SwiftUI
//
//  Created by Gustavo Lozano on 14/09/20.
//  Copyright © 2020 gustavo.lozano. All rights reserved.
//

import SwiftUI

struct CustomWebView: View {
    let url: String
    
    var body: some View {
        Text(url)
    }
}

struct CustomWebView_Previews: PreviewProvider {
    static var previews: some View {
        CustomWebView(url: "url here")
    }
}
