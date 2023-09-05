//
//  CatTagModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 04/09/23.
//

import Foundation

struct CatTagModel: Codable {
    let name: Int
    let value: String
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case value = "Value"
    }
}
extension CatTagModel {
    static let mock = CatTagModel(name: 0, value: "Tabby")

}
