//
//  ArtistDetailsData.swift
//  MisOPlay
//
import Foundation

class ArtistsDetailsData: ObservableObject {
    
    //properties
    @Published var artistDetails: ArtistDetailsModel?
    let name: String
    private var summarySliced: [String] = []

     
    init(name: String) {
        self.name = name
        fetchArtistDetail()

    }
    
    //function for featching artist details
    func fetchArtistDetail() {
        Api().getArtistDetail(name: name) { artist  in
            DispatchQueue.main.async {
                self.artistDetails = artist
                self.summarySliced = self.artistDetails?.artist.bio?.summary?.components(separatedBy: "<") ?? []
                self.artistDetails?.artist.bio?.summary = self.summarySliced.isEmpty ? "" : self.summarySliced[0]
            }
        }
    }
}
