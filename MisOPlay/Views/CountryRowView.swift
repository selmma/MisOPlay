//
//  CountryRowView.swift
//  MisOPlay
//

import SwiftUI

struct CountryRowView: View {
    //properties
    var name: String
    var flag: String
    
    //body
    var body: some View {
        HStack {
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: flag)){ phase in
                    if let image = phase.image {
                        image
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: .center)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2) // Displays the loaded image.
                    } else if phase.error != nil {
                        Image("MisOPlayDrak")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: .center)
                        // Indicates an error.
                    } else {
                        Image("MisOPlayDrak")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: .center)
                        // Acts as a placeholder.
                    }
                }//AsyncImage
                    .frame(width: 80, height: 50)
                
            } else {
                Image("MisOPlayDrak")
                    .resizable()
                    .scaledToFit()
            }
               
            Text(name)
                .fontWeight(.bold)
                .font(.title3)
            
        }//HStack
    }
}
    //preview
struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRowView(name: "Bosnia and Herzegovina", flag: "MisOPlayDark")
            .previewLayout(.sizeThatFits)
    }
}
