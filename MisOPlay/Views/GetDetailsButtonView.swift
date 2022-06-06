//
//  GetDetailsButtonView.swift
//  MisOPlay
//

import SwiftUI

struct GetDetailsButtonView: View {
    //properties
    
    //body
    var body: some View {
        HStack(spacing: 10) {
            Text("Get details")
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
        .frame(width: 250, height: 30, alignment: .center)

    }
}

    //preview
struct GetDetailsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GetDetailsButtonView()
            .previewLayout(.sizeThatFits)
    }
}
