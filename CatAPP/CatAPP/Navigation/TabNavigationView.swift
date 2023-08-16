//
//  TabNavigationView.swift
//  CatAPP
//
//  Created by Moises Lopez on 16/08/23.
//

import SwiftUI

struct TabNavigationView: View {
    var body: some View {
        TabView {
            CatView()
                .tabItem{
                    Label("Cat", systemImage: "doc")
                }
            CatRandomView()
                .tabItem{
                    Label("Random", systemImage: "magazine")
                }
        }
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
