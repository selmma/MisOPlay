//
//  CountryModel.swift
//  MisOPlay
//

import Foundation

class CountryModel: Decodable, Identifiable, Hashable {
    static func == (lhs: CountryModel, rhs: CountryModel) -> Bool {
        lhs.id == rhs.id
    }
    
    
    func hash(into hasher: inout Hasher){
        name.common.hash(into: &hasher)
    }
    
    var id: String{name.common}
    var name: Name
    var flags: Flags
}

struct Name: Decodable {
    var common: String
}

struct Flags: Decodable {
    var png: String?
}
