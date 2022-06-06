//
//  SimilarArtistsView.swift
//  MisOPlay
//

import SwiftUI

struct SimilarArtistsView: View {
    
    //properties
    @State private var isAnimating: Bool = false
    var name: String
    var image: String
    
    //body
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorPurpleHeart"), Color("ColorMinsk")]), startPoint: .top, endPoint: .bottom)
            VStack(spacing: 1.4) {
                AsyncImage(url: URL(string: image)){ phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 170, height: 170, alignment: .center)
                            .scaleEffect(isAnimating ? 1 : 0.6)
                            .cornerRadius(10)
                    } else if phase.error != nil {
                        Color.red // Indicates an error.
                    } else {
                        Image("MisOPlayDrak") // Acts as a placeholder.
                    }
                }
                Text(name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .shadow(color: Color("ColorTwilight"), radius: 2, x: 2, y: 2)
            }//VStack
        }//ZStack
        .onAppear{
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }

        .frame(minWidth: 220, maxWidth: 220, minHeight: 220, maxHeight: 220, alignment: .center)
        .cornerRadius(20)
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
    }
}

    //preview
struct SimilarArtistsView_Previews: PreviewProvider {
    static var previews: some View {
        SimilarArtistsView(name: "The Weeknd", image: "theWeeknd")
            .previewLayout(.sizeThatFits)
    }
}
