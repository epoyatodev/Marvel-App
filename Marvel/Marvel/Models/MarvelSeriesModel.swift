//
//  MarvelSeriesModel.swift
//  Marvel
//
//  Created by Enrique Poyato Ortiz on 27/3/23.
//


import Foundation

// MARK: - MarvelSeriesModel
struct MarvelSeriesModel: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: SeriesClass
}

// MARK: - DataClass
struct SeriesClass: Codable {
    let offset, limit, total, count: Int
    let results: [Series]
}

// MARK: - Result
struct Series: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
//    let resourceURI: String
//    let urls: [URLElement]
//    let startYear, endYear: Int
//    let rating, type: String
//    let modified: String
    let thumbnail: Thumbnail
//    let creators: Creators
//    let characters: Characters
//    let stories: Stories
//    let comics, events: Characters
    //let next, previous: JSONNull?
}

// MARK: - Characters
struct Characters: Codable {
    let available: Int
    let collectionURI: String
    let items: [CharactersItem]
    let returned: Int
}

// MARK: - CharactersItem
struct CharactersItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Creators
struct Creators: Codable {
    let available: Int
    let collectionURI: String
    let items: [CreatorsItem]
    let returned: Int
}

// MARK: - CreatorsItem
struct CreatorsItem: Codable {
    let resourceURI: String
    let name, role: String
}


enum TypeEnum: String, Codable {
    case cover = "cover"
    case interiorStory = "interiorStory"
}



