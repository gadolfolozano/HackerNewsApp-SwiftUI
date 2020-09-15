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
    
    func populateDummyData(){
        posts.append(contentsOf: [
            NewsModel(id: "0", detail: "olo"),
            NewsModel(id: "1", detail: "que"),
            NewsModel(id: "2", detail: "hace"),
            NewsModel(id: "3", detail: "o no hace")
        ])
    }
}

