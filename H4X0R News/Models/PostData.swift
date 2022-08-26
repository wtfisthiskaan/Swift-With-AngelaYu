//
//  PostData.swift
//  H4X0R News
//
//  Created by Kaan Uslu on 26.08.2022.
//

import Foundation

struct Results: Decodable{
    let hits: [Post]
}

struct Post: Decodable, Identifiable{
    //title, points, url
    var id: String{
        return objectID
    }
    let title: String
    let points: Int
    let url: String?
    let objectID: String
}
