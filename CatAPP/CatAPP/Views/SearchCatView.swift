//
//  SearchCatView.swift
//  CatAPP
//
//  Created by Moises Lopez on 01/09/23.
//

import SwiftUI

struct SearchCatView: View {
    @ObservedObject var catViewModel: CatDetailViewModel
    @State private var searchIsActive = false
    @State private var isPresented = false
    @State private var identifierValue = ""
    var body: some View {
        NavigationStack {
            List {
                ForEach(catViewModel.filteredCats) { singleCat in
                    Button {
                        identifierValue = singleCat.id
                        isPresented.toggle()
                    } label : {
                        CatCardView(singlePet: singleCat, catViewModel: catViewModel)
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

struct SearchCatView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCatView(catViewModel: CatDetailViewModel())
    }
}
