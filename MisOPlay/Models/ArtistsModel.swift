//
//  ArtistsModel.swift
//  MisOPlay
//

import Foundation

struct ArtistsModel: Decodable {

    var topartists: TopArtist
}
struct TopArtist: Decodable {
    var artist: [ArtistModel]
}

struct ArtistModel: Decodable, Identifiable, Hashable {
    static func == (lhs: ArtistModel, rhs: ArtistModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher){
        name.hash(into: &hasher)
    }
    
    var id: String {name}
    var name: String
    var listeners: String?
    var image: [ImageModel]?
}

struct ImageModel: Decodable {
    var text: String?
    var size: String?
    
    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size = "size"
    }
}


