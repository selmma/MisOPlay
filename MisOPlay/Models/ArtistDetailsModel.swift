//
//  ArtistDetailsModel.swift
//  MisOPlay
//

import Foundation

struct ArtistDetailsModel: Decodable {
    var artist: Artist
}

struct Artist: Decodable {
    var name: String?
    var url: String?
    var image: [ImageModel]?
    var stats: Stats?
    var tags: Tag?
    var bio: Bio?
    var similar: SimilarArtist?
}

struct Bio: Decodable {
    var published: String?
    var summary: String?
}
struct Tag: Decodable {
    var tag: [TagModel]?
}
struct TagModel: Decodable {
    let name: String?
    let url: String?
}

struct Stats: Decodable {
    let listeners: String?
    let playcount: String?
}

struct SimilarArtist: Decodable {
    let artist: [ArtistModel]?
}
