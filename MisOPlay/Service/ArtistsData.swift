//
//  ArtistsData.swift
//  MisOPlay
//


import Foundation

class ArtistsData: ObservableObject {
    
    //properties
    @Published var artists = [ArtistModel]()
    let country: String
     
    init(country: String) {
        self.country = country
    }
    
    //function for featching data
    func fetchArtists(page: Int) {
        print("Page is: \(page)")
        Api().getCountryArtists(country: country, page: page) { artists  in
            DispatchQueue.main.async {
                print("Artist: \(artists.count)")
                self.artists += artists
            }
        }
        
    }
}
