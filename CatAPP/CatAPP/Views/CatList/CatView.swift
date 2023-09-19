//
//  CatView.swift
//  CatAPP
//
//  Created by Moises Lopez on 16/08/23.
//

import SwiftUI

struct CatView: View {
    @ObservedObject var catListViewModel: CatListViewModel
    fileprivate typealias CatConstants = Constants.CatView
    @State private var showingSheet = false
    @State private var petIsCreatedState = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(Constants.Color.mainBackgroundColor)
                if !catListViewModel.pets.isEmpty {
                    CatCardContainerView(catListViewModel: catListViewModel,
                                         cardViewModel: CatCardContainerViewModel(pets: catListViewModel.pets))
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
            catListViewModel.transformData(petModel: CoreDataManager.shared.fetchAllCats())
        }
        .fullScreenCover(isPresented: $showingSheet) {
            CatDetailsView(petViewModel: CatDetailViewModel(catListViewModel: catListViewModel))
        }
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView(catListViewModel: CatListViewModel())
    }
}
