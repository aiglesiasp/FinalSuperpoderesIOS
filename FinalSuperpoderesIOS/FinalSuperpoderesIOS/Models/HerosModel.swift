//
//  HerosModel.swift
//  FinalSuperpoderesIOS
//
//  Created by Aitor Iglesias Pubill on 10/12/22.
//

import Foundation

//MARK: PARA EL FILTRO DE SERVIDOR
struct HeroFilter: Codable {
    var name: String
}

// MARK: - Welcome
struct HeroWelcome: Codable{
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: HeroDataClass
}

// MARK: - DataClass
struct HeroDataClass: Codable {
    let offset, limit, total, count: Int
    let result: [Hero]
}

// MARK: - HERO
struct Hero: Codable, Identifiable {
    let id: Int
    let name: String
    let resultDescription: String
    let thumbnail: Thumbnail
    let resourceURI: String
}


