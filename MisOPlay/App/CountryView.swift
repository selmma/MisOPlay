//
//  CountryView.swift
//  MisOPlay
//

import SwiftUI

struct CountryView: View {
    
    //properties
    @ObservedObject var countriesData = CountriesData()
    @State var searchingFor =  ""
    
    //body
    var body: some View {
            NavigationView {
                List(countriesData.countries, id: \.self) { country in
                 
    
                    NavigationLink(destination: ArtistsView(country: country.name.common)){
                        CountryRowView(name: country.name.common, flag: country.flags.png ?? "")
                                .padding(.vertical, 4)
                        }
                }//List
                .navigationBarTitle("Countries", displayMode: .inline)
                
                
                .searchable(text: $searchingFor)
                .onChange(of: searchingFor) { searchingFor in
                    countriesData.searchingData(search: searchingFor)
                }
            }//Navigation
    }
}

    //preview
struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView()
    }
}
