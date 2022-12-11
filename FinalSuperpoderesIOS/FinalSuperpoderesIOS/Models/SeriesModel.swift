//
//  SerieModel.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import Foundation

// MARK: - Welcome
struct SerieWelcome: Codable{
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: SerieDataClass
}

// MARK: - DataClass
struct SerieDataClass: Codable {
    let offset, limit, total, count: Int
    let result: [Serie]
}

// MARK: - Comics
struct Serie: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
    let resourceURI: String
}
