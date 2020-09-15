//
//  ContentView.swift
//  HackerNewsApp-SwiftUI
//
//  Created by Gustavo Lozano on 10/09/20.
//  Copyright © 2020 gustavo.lozano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                NavigationLink(destination: CustomWebView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.detail)
                    }
                }
            }
            .navigationBarTitle(Text("HackerNewsApp"))
        }
        .onAppear {
            self.viewModel.fetchPosts()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
