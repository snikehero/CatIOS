//
//  RandomCatViewModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 28/08/23.
//

import Foundation
@MainActor class RandomCatViewModel: ObservableObject {
    @Published var randomCat: [RandomCatModel] = []
    let networkManager: NetworkManager
    let endpointBuilder: EndpointBuilder

    init(networkManager: NetworkManager, endpointBuilder: EndpointBuilder) {

        self.networkManager = networkManager
        self.endpointBuilder = endpointBuilder
    }

    func fetchRandomCat() {
        networkManager.fetchData(
            endpoint: endpointBuilder.getRandomCat(),
            type: [RandomCatModel].self) { randomCat in
                if let randomCat = randomCat {
                    DispatchQueue.main.async { [weak self] in
                        self?.randomCat = randomCat
                    }
                }
            }
    }
}
