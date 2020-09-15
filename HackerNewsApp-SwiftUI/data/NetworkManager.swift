//
//  NetworkManager.swift
//  HackerNewsApp-SwiftUI
//
//  Created by Gustavo Lozano on 14/09/20.
//  Copyright © 2020 gustavo.lozano. All rights reserved.
//

import Foundation

class NetworkManager {
    let fetchUrl = "https://hn.algolia.com/api/v1/search?tags=front_page"
    
    var delegate: NetworkDelegate?
    
    func fetchPosts() {
        if let url = URL(string: fetchUrl){
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let jsonData = data {
                    do {
                        let response = try JSONDecoder().decode(FetchPostsResponse.self, from: jsonData)
                        self.delegate?.onFetchPostsSuccess(posts: self.toModel(response.hits))
                    } catch {
                        print("error while parsing")
                    }
                }
                if let e = error {
                    print("failed performing the request \(e)")
                }
            }
            task.resume()
        }
    }
    
    private func toModel(_ hits: [Hit]) -> [NewsModel] {
        hits.map { hit in
            NewsModel(id: hit.objectID, detail: hit.title, url: hit.url)
        }
    }
}

protocol NetworkDelegate {
    func onFetchPostsSuccess(posts: [NewsModel])
}
