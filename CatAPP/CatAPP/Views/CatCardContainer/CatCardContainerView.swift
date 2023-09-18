//
//  CatCardContainerView.swift
//  CatAPP
//
//  Created by Moises Lopez on 18/08/23.
//

import SwiftUI

struct CatCardContainerView: View {
    @ObservedObject var catListViewModel: CatListViewModel
    @ObservedObject var cardViewModel: CatCardContainerViewModel
    var body: some View {
        NavigationView {
            List {
                ForEach(cardViewModel.filteredCats) { singlePet in
                    Button {
                        cardViewModel.identifierValue = singlePet.id
                        cardViewModel.isPresented.toggle()
                    } label: {
                        CatCardView(singlePet: singlePet)
                            .frame(maxWidth: Constants.CardContainer.frameMaxWidth)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .onDelete(perform: { indexSet in
                    cardViewModel.deleteFromCoreData(at: indexSet)
                })
                .fullScreenCover(isPresented: $cardViewModel.isPresented) {
                    ShowCatDetailsView(catListViewModel: catListViewModel,
                                       petViewModel: UpdateCatViewModel(catListViewModel: catListViewModel,
                                                                        identifier: cardViewModel.identifierValue))
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .searchable(text: $cardViewModel.searchText)
    }
}

struct CatCardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CatCardContainerView( catListViewModel: .init(),
                              cardViewModel: .init(pets: CatDetailViewModel.petsMock))
    }
}
