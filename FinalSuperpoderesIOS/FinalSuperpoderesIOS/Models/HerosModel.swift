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

// MARK: - Result
struct Heros: Codable, Identifiable {
    let id: Int
    let name: String
    let resultDescription: String
    let modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics: Comics
    let series: Series
    let stories: Stories
    let events: Events
    let urls: [URLElement]
}

// MARK: - Comics
struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Series
struct Series: Codable {
    let available: Int
    let collectionURI: String
    let items: [SeriesItem]
    let returned: Int
}

// MARK: - SeriesItem
struct SeriesItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Stories
struct Stories: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI: String
    let name: String
    let type: String
}

// MARK: - Events
struct Events: Codable {
    let available: Int
    let collectionURI: String
    let items: [EventsItem]
    let returned: Int
}

// MARK: - EventsItem
struct EventsItem : Codable{
    let resourceURI: String
    let name: String
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String
}

// MARK: - URLElement
struct URLElement: Codable {
    let type: String
    let url: String
}

