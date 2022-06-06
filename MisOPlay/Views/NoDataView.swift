//
//  NoDataView.swift
//  MisOPlay
//

import SwiftUI

struct NoDataView: View {
    
    //property
    @State private var isAnimating: Bool = false
    
    //body
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("ColorPurpleHeart"), Color("ColorMinsk")]), startPoint: .top, endPoint: .bottom)
            VStack {
                Image("sad")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 200, alignment: .center)
                    .scaleEffect(isAnimating ? 1 : 0.6)
                
                Text("There is some problem with data or internet connection")
                    .font(.title)
                    .padding(.horizontal, 20)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("ColorMeteorite"))
            }//VStack
        }//ZStack
        .ignoresSafeArea(.all)
        .onAppear{
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
}
    //preview
struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView()
            .previewLayout(.sizeThatFits)
    }
}
}
