//
//  MainViewModel.swift
//  HackerNewsApp-SwiftUI
//
//  Created by Gustavo Lozano on 14/09/20.
//  Copyright © 2020 gustavo.lozano. All rights reserved.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var posts = [NewsModel]()
    
    let networkManager = NetworkManager()
    
    init() {
        networkManager.delegate = self
    }
    
    func populateDummyData(){
        posts.append(contentsOf: [
            NewsModel(id: "0", detail: "olo", url: "something"),
            NewsModel(id: "1", detail: "que", url: "something"),
            NewsModel(id: "2", detail: "hace", url: "something"),
            NewsModel(id: "3", detail: "o no hace", url: "something")
        ])
    }
    
    func fetchPosts(){
        networkManager.fetchPosts()
    }
}

extension MainViewModel: NetworkDelegate {
    func onFetchPostsSuccess(posts: [NewsModel]) {
        DispatchQueue.main.async {
            self.posts = posts
        }        
    }
}

