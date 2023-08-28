//
//  RandomCatModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 28/08/23.
//

import Foundation

struct RandomCatModel: Codable {
    let imageUrl: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case imageUrl = "url"
        case id = "id"
    }
}
extension RandomCatModel {
    static let randomCatMock = RandomCatModel(imageUrl: "https://cdn2.thecatapi.com/images/Wd_Py_Mj8.jpg", id: "Wd_Py_Mj8")
}
