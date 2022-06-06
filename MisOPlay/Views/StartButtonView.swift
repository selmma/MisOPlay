//
//  StartButtonView.swift
//  MisOPlay
//

import SwiftUI

struct StartButtonView: View {
    //properties
    @AppStorage("isOnboarding") var isOnboarding: Bool?

    //body
    var body: some View {
        Button(action: {
            isOnboarding = false
        }) {
            HStack(spacing: 10) {
                Text("Get started")
                    .foregroundColor(Color("ColorPurpleHeart"))
                    
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
                    .foregroundColor(Color("ColorPurpleHeart"))
                
            }//HStack
            .padding(.horizontal,20)
            .padding(.vertical,10)
            .background(
                Capsule().strokeBorder()
            )
        }//Button
    }
}

    //preview
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .previewLayout(.sizeThatFits)
    }
}
