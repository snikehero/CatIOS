//
//  CatAPPApp.swift
//  CatAPP
//
//  Created by Moises Lopez on 15/08/23.
//

import SwiftUI

@main
struct CatAPPApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    var body: some Scene {
        WindowGroup {
            TabNavigationView()
                .environmentObject(networkMonitor)
        }
    }
}
