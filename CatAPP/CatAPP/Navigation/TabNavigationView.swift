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
                    Label(Constants.TabNavigationView.catLabel,
                          systemImage: Constants.TabNavigationView.catTabIcon)
                }
            CatRandomView()
                .tabItem{
                    Label(Constants.TabNavigationView.randomLabel,
                          systemImage: Constants.TabNavigationView.randomTabIcon)
                }
        }
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
