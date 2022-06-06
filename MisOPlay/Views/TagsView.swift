//
//  TagsView.swift
//  MisOPlay
//

import SwiftUI

struct TagsView: View {
    
    //properties
    var tags: [TagModel]
    
    //body
    var body: some View {
        GroupBox {
            DisclosureGroup("Genre") {
                ForEach(0..<tags.count, id: \.self) { item in
                    Divider().padding(.vertical, 2)
                    HStack {
                        Link(tags[item].name ?? "",
                             destination: URL(string: tags[item].url ?? "")!)
                            .textCase(.uppercase)
                    }//HStack
                }//ForEach
            }//Group
        }//Box
        
        
    }
}

    //preview
struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(tags: [])
    }
}
