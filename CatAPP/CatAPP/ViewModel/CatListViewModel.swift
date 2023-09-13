//
//  CatListViewModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 12/09/23.
//

import Foundation

/// Tiene que hacer funciones de llenado,
/// puesto que el array de pets se pobla al iniciar la aplicacion, este array de inyectara a los demas VMs.

class CatListViewModel: ObservableObject {
    @Published var pets: [PetDetail] = []

    static let shared: CatListViewModel = {
        let catListViewModel = CatListViewModel()
        return catListViewModel
    }()

    func transformData(petModel: [Cat]) {  // Funcion para Transformar los datos del CoreDataManager.
        pets = petModel.map { $0.toPetDetail() }
    }

    func updateArray(singlePet: PetDetail) {
        print("Array updated")
        pets.append(singlePet)
    }
    func updatePets(singlePet: PetDetail) {
        if let index = pets.firstIndex(where: { $0.id == singlePet.id }) {
            pets.remove(at: index)
            pets.insert(singlePet, at: index)
        }
    }

    func printArray() {
        print(pets)
    }
}
