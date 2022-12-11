//
//  ComicModel.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import Foundation


// MARK: - Welcome
struct ComicWelcome: Codable{
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: ComicDataClass
}

// MARK: - DataClass
struct ComicDataClass: Codable {
    let offset, limit, total, count: Int
    let result: [Comic]
}

// MARK: - Comics
struct Comic: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
    let resourceURI: String
}
