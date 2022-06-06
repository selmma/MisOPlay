//
//  ArtistsView.swift
//  MisOPlay
//

import SwiftUI

struct ArtistsView: View {
    
    //properties
    @ObservedObject var artistsData: ArtistsData
    @State var nextPage = 1
    
    init(country: String) {
        self.artistsData = ArtistsData(country: country)
        
    }
    
    //body
    var body: some View {
        
        
        VStack {
            if let listOfArtist = artistsData {
                List(listOfArtist.artists.indices, id: \.self) { artistIndex in
                    let artist = listOfArtist.artists[artistIndex]
                    NavigationLink(destination: ArtistDetailsView(name: artist.name)){
                        ArtistCardView(name: artist.name, image: artist.image?[2].text ?? "").onAppear{
                            if artistIndex == listOfArtist.artists.count - 2 {
                                self.nextPage += 1
                                listOfArtist.fetchArtists(page: nextPage)
                                }
                            }
                        }//NavigationLink
                }//List
            } else {
                NoDataView()
            }
                 
        }//VStack
            .onAppear {
               artistsData.fetchArtists(page: nextPage)
           }
    }
}

    //preview
struct ArtistsView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistsView(country: "spain")
    }
}
