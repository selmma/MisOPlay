//
//  ArtistDetailsView.swift
//  MisOPlay
//

import SwiftUI

struct ArtistDetailsView: View {
    
    //properties
    @ObservedObject var artistsDetailsData: ArtistsDetailsData
    private var summary: [String] = []
    
    init(name: String) {
        self.artistsDetailsData = ArtistsDetailsData(name: name)
        self.summary = self.artistsDetailsData.artistDetails?.artist.bio?.summary?.components(separatedBy: "<") ?? []
    }
    
    //body
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorTwilight"), Color("ColorMeteorite")]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
            if let artistDetails = artistsDetailsData.artistDetails {
                
                ScrollView(.vertical, showsIndicators: false)
                {
                    VStack {
                        ArtisDetailHeaderView(image: artistDetails.artist.image?[4].text ?? "")
                        VStack(alignment: .leading, spacing: 20) {
                          //TITLE
                            Text(artistDetails.artist.name ?? "")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundColor(Color("ColorMeteorite"))
                                .italic()
                            
                            //GENRE
                            TagsView(tags: artistDetails.artist.tags?.tag ?? [])
                            HStack{
                                Text("Number of listeners: ")
                                    .font(.title3)
                                    .foregroundColor(Color("ColorPurpleHeart"))
                                Text(artistDetails.artist.stats?.listeners ?? "")
                            }//HStack
                            HStack{
                                Text("Number of playcount: ")
                                    .font(.title3)
                                    .foregroundColor(Color("ColorPurpleHeart"))
                                Text(artistDetails.artist.stats?.playcount ?? "")
                            }//HStack
                            
                            // DESCRIPTION
                            Text(artistDetails.artist.bio?.summary ?? "")
                            
                            //SIMILAR ARTISTS
                            VStack {
                                Text("Similar artists")
                                    .font(.title2)
                                    .foregroundColor(Color("ColorPurpleHeart"))
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack{
                                        ForEach(artistDetails.artist.similar?.artist ?? [], id: \.self) { artist in
                                            NavigationLink(destination: ArtistDetailsView(name: artist.name)) {
                                                SimilarArtistsView(name: artist.name, image: artist.image?[4].text ?? "")
                                            }
                                                
                                        }
                                        
                                    }
                                   
                                }
                            }
                            //LINK
                            LinkView(name: artistDetails.artist.name ?? "",
                                     link: artistDetails.artist.url ?? "")
                        } //VStack
                        .padding(.horizontal, 20)
                        .frame(maxWidth: 640, alignment: .center)
                    }//Vstack
                }//ScrollView
                
                } else {
                NoDataView()
            }
        }//ZStack
        .onAppear {
            artistsDetailsData.fetchArtistDetail()
        }
            .edgesIgnoringSafeArea(.top)
    }
}


    //preview
struct ArtistDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistDetailsView(name: "Coldplay")
    }
}
