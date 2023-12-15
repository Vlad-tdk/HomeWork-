//
//  RootView.swift
//  HomeWork#
//
//  Created by Vlad on 14.12.23..
//

import SwiftUI

struct RootView: View {
    @StateObject private var userManager = UserManager()
    
    var body: some View {
        Group {
            if userManager.user.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
        }.environmentObject(userManager)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
