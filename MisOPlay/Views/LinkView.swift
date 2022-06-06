//
//  LinkView.swift
//  MisOPlay
//

import SwiftUI

struct LinkView: View {
    //properties
    let name: String
    let link: String
    
    //body
    var body: some View {
        HStack {
            Text("Get more information about \(name)  on")
            Link("Last.fm", destination: URL(string: link)!)
            Image(systemName: "arrow.up.right.square")
        }//HStack
        .font(.footnote)
        .frame(width: 360, height: 60, alignment: .center)
        .background(Color("ColorPurpleHeart"))
        .cornerRadius(10)
        .padding(3)
    }
}

    //preview
struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView(name: "Rihanna", link: "https://www.last.fm/music/Rihanna")
            .previewLayout(.sizeThatFits)
    }
}
