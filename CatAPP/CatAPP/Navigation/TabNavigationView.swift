//
//  TabNavigationView.swift
//  CatAPP
//
//  Created by Moises Lopez on 16/08/23.
//

import SwiftUI

struct TabNavigationView: View {
    @StateObject var petViewModel = CatDetailViewModel()
    @StateObject var randomCatViewModel = RandomCatViewModel(networkManager: NetworkManager(),
                                                             endpointBuilder: EndpointBuilder())
    fileprivate typealias TabConstants = Constants.TabNavigation
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var networkMonitor: NetworkMonitor
    var body: some View {
        Group {
            TabView {
                CatView(catViewModel: petViewModel)
                    .tabItem {
                        Label(TabConstants.catLabel,
                              systemImage: TabConstants.catTabImage)
                    }
                if networkMonitor.isConnected {
                    RandomCatView(randomCatViewModel: randomCatViewModel)
                        .tabItem {
                            Label(TabConstants.randomLabel,
                                  systemImage: TabConstants.catRandomImage)
                        }
                } else {
                    NoInternetView()
                        .tabItem {
                            Label(TabConstants.randomLabel,
                                  systemImage: TabConstants.catRandomImage)
                        }
                }
            }

        }
        .toolbar(.visible, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
            .environmentObject(NetworkMonitor.init(isConnected: false))
    }
}
