//
//  CatCardContainerViewModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 12/09/23.
//

import Foundation

class CatCardContainerViewModel: ObservableObject {
    @Published var isPresented = false
    @Published var identifierValue = "123"
    @Published var filteredPets: [PetDetail] = []
    @Published var searchText = ""
    @Published var pets: [PetDetail]
    var manager: CoreDataManager
    init(pets: [PetDetail], manager: CoreDataManager) {
        self.pets = pets
        self.manager = manager

    }
    var filteredCats: [PetDetail] {
        if searchText.isEmpty {
            return pets
        }
        return pets.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    func deleteFromCoreData(at offsets: IndexSet) {
        for offset in offsets {
            let singlePet = pets[offset]
            manager.removeCat(singlePet: singlePet)
            pets.remove(at: offset)
            manager.save()
        }
    }
}
