//
//  CatDetailViewModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 17/08/23.
//

import Foundation
@MainActor class CatDetailViewModel: ObservableObject {
    @Published var pets: [PetDetail] = petsMock
    func saveData(name: String, petAge: Int, appointment: Date, breed: String ) {
        print("Saving Data to VM")
        let singlePet = PetDetail(name: name, petYear: petAge, breed: breed, appointment: appointment)
        pets.append(singlePet)
        print(singlePet)
    }
}

extension CatDetailViewModel {
    static let petsMock = [PetDetail(name: "Pitt", petYear: 7, breed: "Cruza", appointment: Date.now),
                           PetDetail(name: "Jojo", petYear: 4, breed: "Electrico", appointment: Date.now),
                           PetDetail(name: "Momo", petYear: 3, breed: "Volador", appointment: Date.now),
                           PetDetail(name: "Mica", petYear: 5, breed: "Callejero", appointment: Date.now)
                           ]
}
