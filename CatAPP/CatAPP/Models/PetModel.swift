//
//  PetModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 17/08/23.
//

import Foundation

struct PetDetail {
    let name: String
    let petYear: Int
    let breed: String
    let appointment: Date
}

extension PetDetail {
    static var mockSushi = PetDetail(name: "Sushi", petYear: 7, breed: "Cruza", appointment: Date.now)
    static var mockJojo = PetDetail(name: "Jojo", petYear: 4, breed: "Electrico", appointment: Date.now)
    static var mockMomo = PetDetail(name: "Momo", petYear: 3, breed: "Volador", appointment: Date.now)
    static var mockMica = PetDetail(name: "Mica", petYear: 5, breed: "Callejero", appointment: Date.now)
}
