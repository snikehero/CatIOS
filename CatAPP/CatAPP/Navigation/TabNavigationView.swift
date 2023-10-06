//
//  TabNavigationView.swift
//  CatAPP
//
//  Created by Moises Lopez on 16/08/23.
//

import SwiftUI

struct TabNavigationView: View {
    @StateObject var tagViewModel = CatTagViewModel(networkManager: NetworkManager(),
                                                    endpointBuilder: EndpointBuilder())

    @StateObject var randomCatViewModel = RandomCatViewModel(networkManager: NetworkManager(),
                                                             endpointBuilder: EndpointBuilder())
    @StateObject var catListviewModel = CatListViewModel()
    @StateObject var coreDataLiveManager = CoreDataManager(persistenceContainer: CoreDataManager.live)
    fileprivate typealias TabConstants = Constants.TabNavigation
    @EnvironmentObject var networkMonitor: NetworkMonitor
    var body: some View {
        Group {
            TabView {
                CatView(catListViewModel: catListviewModel, coreDataLiveManager: coreDataLiveManager)
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
                if networkMonitor.isConnected {
                    InfiniteScrollingView(tagViewModel: tagViewModel)
                        .tabItem {
                            Label(TabConstants.infiniteLabel,
                                  systemImage: TabConstants.infiniteImage)
                        }
                } else {
                    NoInternetView()
                        .tabItem {
                            Label(TabConstants.infiniteLabel,
                                  systemImage: TabConstants.catRandomImage)
                        }
                }
            }
            .onAppear() {
                coreDataLiveManager.loadStore()
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
