//
//  TabNavigationView.swift
//  CatAPP
//
//  Created by Moises Lopez on 16/08/23.
//

import SwiftUI

struct TabNavigationView: View {
    @StateObject var petViewModel = CatDetailViewModel()
    @StateObject var randomCatViewModel = RandomCatViewModel()
    fileprivate typealias TabConstants = Constants.TabNavigation
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        TabView {
            CatView(catViewModel: petViewModel)
                .tabItem {
                    Label(TabConstants.catLabel,
                          systemImage: TabConstants.catTabImage)
                }
            RandomCatView(randomCatViewModel: randomCatViewModel)
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
