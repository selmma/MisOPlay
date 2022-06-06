//
//  ArtistCardView.swift
//  MisOPlay
//


import SwiftUI

struct ArtistCardView: View {
    
    //properties
    @State private var isAnimating: Bool = false
    var name: String
    var image: String
    
    //body
    var body: some View {
       
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ColorTwilight"), Color("ColorMeteorite")]), startPoint: .top, endPoint: .bottom)
            VStack(spacing: 3) {
                AsyncImage(url: URL(string: image)){ phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 280, height: 280, alignment: .center)
                            .scaleEffect(isAnimating ? 1 : 0.6)
                            .cornerRadius(10)
                    } else if phase.error != nil {
                        Image("MisOPlayDark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 280, height: 280, alignment: .center)
                            // Indicates an error.
                    } else {
                        Image("MisOPlayDrak")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 280, height: 280, alignment: .center)
                            // Acts as a placeholder.
                    }
                }//AsyncImage
                Text(name)
                    .font(.title)
                    .fontWeight(.bold)
                    .shadow(color: Color("ColorTwilight"), radius: 2, x: 2, y: 2)
                    .padding(5)
                    .multilineTextAlignment(.center)
                GetDetailsButtonView()
                    .padding(.top, 20)
            }//VStack
        }//ZStack
        .padding(.trailing, 30)
        .onAppear{
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }

        .frame(minWidth: 320, maxWidth: 350, minHeight: 500, maxHeight: 700, alignment: .center)
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
    }
}


    //preview
struct ArtistCardView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistCardView(name: "The Weeknd", image: "theWeeknd")
            .previewLayout(.sizeThatFits)
    }
}
