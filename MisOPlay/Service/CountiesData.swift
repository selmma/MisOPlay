//
//  CountiesData.swift
//  MisOPlay
//


import Foundation

class CountriesData: ObservableObject {
    
    //properties
  @Published var countries = [CountryModel]()
  private var localCountries = [CountryModel]()
     
    init() {
        Api().getCountries { countries in
            DispatchQueue.main.async {
                self.countries = countries
                self.localCountries = countries
            }
        }
    }
    
    //function for searching countries
    func searchingData (search: String) {
        if !search.isEmpty {
           let filteredCountries = localCountries.filter { country in
                country.name.common.contains(search)
            }
            self.countries = filteredCountries
        } else {
            self.countries = localCountries
        }
    }
}
