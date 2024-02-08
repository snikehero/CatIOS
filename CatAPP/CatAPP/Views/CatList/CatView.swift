//
//  CatView.swift
//  CatAPP
//
//  Created by Moises Lopez on 16/08/23.
//

import SwiftUI

struct CatView: View {
    @ObservedObject var catListViewModel: CatListViewModel
    @ObservedObject var coreDataLiveManager: CoreDataManager
    fileprivate typealias CatConstants = Constants.CatView
    @State private var showingSheet = false
    @State private var petIsCreatedState = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(Constants.Color.mainBackgroundColor)
                if !catListViewModel.pets.isEmpty {
                    CatCardContainerView(catListViewModel: catListViewModel,
                                         cardViewModel: CatCardContainerViewModel(pets: catListViewModel.pets,
                                                                                  manager: coreDataLiveManager),
                                         coreDataLiveManager: coreDataLiveManager)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    showingSheet.toggle()
                                } label: {
                                    CatConstants.plusIcon
                                }
                            }
                        }
                } else {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Text("\(CatConstants.plusIcon) \(CatConstants.createPetLabel)")
                    }
                }
            }
        }
        .onAppear {
            catListViewModel.transformData(petModel: coreDataLiveManager.fetchAllCats())
        }
        .fullScreenCover(isPresented: $showingSheet) {
            CatDetailsView(petViewModel: CatDetailViewModel(catListViewModel: catListViewModel,
                                                                manager: coreDataLiveManager)
            )
        }
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView(catListViewModel: CatListViewModel(),
                coreDataLiveManager: CoreDataManager(persistenceContainer: CoreDataManager.mock))
    }
}
