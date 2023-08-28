//
//  RandomCatView.swift
//  CatAPP
//
//  Created by Moises Lopez on 16/08/23.
//

import SwiftUI

struct RandomCatView: View {
    fileprivate typealias CardConstants = Constants.RandomCat
    @ObservedObject var randomCatViewModel: RandomCatViewModel

    var body: some View {
        NavigationStack {
            AsyncImage(url: URL(string: randomCatViewModel.randomCat.first?.urlString
                                ?? RandomCatModel.randomCatMock.urlString),
                       content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(30)
            }, placeholder: {
                ProgressView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print(randomCatViewModel.fetchRandomCat())
                    } label: {
                        Text(CardConstants.reloadButton)
                    }
                }
            }
        }
    }
}

struct RandomCatView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCatView(randomCatViewModel:
                        RandomCatViewModel(networkManager:
                                            NetworkManager(),
                                           endpointBuilder: EndpointBuilder()))
    }
}
