//
//  FetchPostsResponse.swift
//  HackerNewsApp-SwiftUI
//
//  Created by Gustavo Lozano on 14/09/20.
//  Copyright © 2020 gustavo.lozano. All rights reserved.
//

import Foundation

struct FetchPostsResponse : Codable {
    let hits: [Hit]
}

struct Hit : Codable {
    let objectID: String
    let title: String
    let url: String
    let points: Int
}
