//
//  RandomCatViewModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 28/08/23.
//

import Foundation
@MainActor class RandomCatViewModel: ObservableObject {
    @Published var randomCat: RandomCatModel = .randomCatMock
}
