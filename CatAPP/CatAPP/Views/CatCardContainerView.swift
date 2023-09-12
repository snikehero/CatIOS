//
//  CatCardContainerView.swift
//  CatAPP
//
//  Created by Moises Lopez on 18/08/23.
//

import SwiftUI

struct CatCardContainerView: View {
    @ObservedObject var catViewModel: CatDetailViewModel
    @State private var isPresented = false
    @State private var identifierValue = "123"
    var body: some View {
        NavigationView {
            List {
                ForEach(catViewModel.filteredCats) { singlePet in
                    Button {
                        identifierValue = singlePet.id
                        isPresented.toggle()
                    } label: {
                        CatCardView(singlePet: singlePet)
                            .frame(maxWidth: Constants.CardContainer.frameMaxWidth)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .onDelete(perform: { indexSet in
                    catViewModel.deleteFromCoreData(at: indexSet)
                })
                .fullScreenCover(isPresented: $isPresented) {
                    ShowCatDetailsView(petViewModel: catViewModel, identifier: $identifierValue)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .searchable(text: $catViewModel.searchText)
    }
}

struct CatCardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CatCardContainerView(catViewModel: CatDetailViewModel())
    }
}
