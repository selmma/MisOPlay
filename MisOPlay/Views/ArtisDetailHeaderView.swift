//
//  ArtisDetailHeaderView.swift
//  MisOPlay
//

import SwiftUI

struct ArtisDetailHeaderView: View {
    //properties
    @State private var isAnimating: Bool = false
    var image: String
    
    //body
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorTwilight"), Color("ColorMeteorite")]), startPoint: .top, endPoint: .bottom)
            
            AsyncImage(url: URL(string: image)){ phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350, alignment: .center)
                        .scaleEffect(isAnimating ? 1 : 0.6)
                        .cornerRadius(10)
                } else if phase.error != nil {
                    Color.red // Indicates an error.
                } else {
                    Image("MisOPlayDrak") // Acts as a placeholder.
                }
            }//AsyncImage
            
        }//ZStack
        .frame(height: 440)
        .onAppear() {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
    }
}

    //preview
struct ArtisDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ArtisDetailHeaderView(image: "theWeeknd")
            .previewLayout(.fixed(width: 375, height: 440))
    }
}
