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
                    Label(Constants.TabNavigation.catLabel,
                          systemImage: Constants.TabNavigation.catTabImage)
                }
            RandomCatView()
                .tabItem{
                    Label(Constants.TabNavigation.randomLabel,
                          systemImage: Constants.TabNavigation.catRandomImage)
                }
        }
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
