//
//  RandomCatModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 28/08/23.
//

import Foundation

struct RandomCatModel: Codable {
    let id: String
    let urlString: String
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case urlString = "url"
    }
}
extension RandomCatModel {
    static let randomCatMock = RandomCatModel(
        id: "Wd_Py_Mj8",
        urlString: "https://cdn2.thecatapi.com/images/Wd_Py_Mj8.jpg")

}
