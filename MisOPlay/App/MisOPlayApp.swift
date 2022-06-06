//
//  MisOPlayApp.swift
//  MisOPlay
//
//  Created by systech on 30. 5. 2022..
//

import SwiftUI

@main
struct MisOPlayApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                CountryView()
            }
        }
    }
}
