//
//  CatView.swift
//  CatAPP
//
//  Created by Moises Lopez on 16/08/23.
//

import SwiftUI

struct CatView: View {
    @ObservedObject var catViewModel: CatDetailViewModel

    fileprivate typealias CatConstants = Constants.CatView
    @State private var showingSheet = false
    @State private var petIsCreatedState = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(Constants.Color.mainBackgroundColor)
                if !catViewModel.pets.isEmpty {
                    CatCardContainerView(catViewModel: catViewModel)
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
            catViewModel.transformData(petModel: CoreDataManager.shared.fetch())
        }
        .fullScreenCover(isPresented: $showingSheet) {
            CatDetailsView(petViewModel: catViewModel, petAppointment: Date())
        }
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView(catViewModel: CatDetailViewModel())
    }
}
