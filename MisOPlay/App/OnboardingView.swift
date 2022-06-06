//
//  OnboardingView.swift
//  MisOPlay
//
//  Created by systech on 30. 5. 2022..
//

import SwiftUI

struct OnboardingView: View {
    //properties
    @State private var isAnimating: Bool = false
    
    //body
    var body: some View {
        ZStack {
            Color("ColorMeteorite").ignoresSafeArea(.all, edges: .all)
            
            VStack {
                Image("MisOPlayDark")
                    .resizable()
                    .padding(.bottom, 15.0)
                    .scaledToFit()

                StartButtonView()
                    .frame(height: 80, alignment: .center)
                    .padding()
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 40)
                    .animation(.easeOut(duration: 1), value: isAnimating)
            }//VStack
        }//ZStack
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

    //preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
