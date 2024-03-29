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
            ZStack {
                Color(Constants.Color.mainBackgroundColor)
                ScrollView {
                    AsyncImage(url: URL(string: randomCatViewModel.randomCat.first?.urlString
                                        ?? RandomCatModel.randomCatMock.urlString),
                               content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(CardConstants.photoFrameRadius)
                            .frame(width: CardConstants.photoFrameWidth,
                                   height: CardConstants.photoFrameHeight)
                    }, placeholder: {
                        ProgressView()
                    })
                    Text("Swipe down to refresh")
                }
            }
            .refreshable {
                randomCatViewModel.fetchRandomCat()
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
