//
//  GetArtistDetails.swift
//  MisOPlay
//

import Foundation


let APIKEY = "b5a2a19b251a3f54cd0e702a875f444f"

class Api {
    
    //Get details for one artist
    func getArtistDetail(name: String, completion: @escaping (ArtistDetailsModel) -> ()) {
        guard let url = URL(string: "http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=\(name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")&api_key=\(APIKEY)&format=json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let artistDetails = try! JSONDecoder().decode(ArtistDetailsModel.self, from: data!)
            
            DispatchQueue.main.async {
                completion(artistDetails)
            }
        }
        .resume()
    }
    
    //Get all top artists for one Country
    func getCountryArtists(country: String, page: Int, completion: @escaping ([ArtistModel]) -> ()) {
        let urlString = "http://ws.audioscrobbler.com/2.0/?method=geo.gettopartists&country=\(country.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")&\(page)&api_key=\(APIKEY)&format=json"
        
            
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let countryArtists = try! JSONDecoder().decode(ArtistsModel.self, from: data!).topartists.artist
//            let image = try! JSONDecoder().decode(ImageModel, from: data!)
            
            DispatchQueue.main.async {
                completion(countryArtists)
            }
        }
        .resume()
    }
    
    //Get Countries
    func getCountries(completion: @escaping ([CountryModel]) -> ()) {
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let countries = try! JSONDecoder().decode([CountryModel].self, from: data!)
            
            DispatchQueue.main.async {
                completion(countries)
            }
        }
        .resume()
    }
}


