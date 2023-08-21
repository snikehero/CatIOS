//
//  TabNavigationView.swift
//  CatAPP
//
//  Created by Moises Lopez on 16/08/23.
//

import SwiftUI

struct TabNavigationView: View {
    @StateObject var petViewModel = CatDetailViewModel()
    fileprivate typealias TabConstants = Constants.TabNavigation

    var body: some View {
        TabView {
            CatView(catViewModel: petViewModel)
                .tabItem {
                    Label(TabConstants.catLabel,
                          systemImage: TabConstants.catTabImage)
                }
            RandomCatView()
                .tabItem {
                    Label(TabConstants.randomLabel,
                          systemImage: TabConstants.catRandomImage)
                }
        }
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
