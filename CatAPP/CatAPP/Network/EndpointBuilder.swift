//
//  EndpointBuilder.swift
//  CatAPP
//
//  Created by Moises Lopez on 28/08/23.
//

import Foundation
class EndpointBuilder {
    private var components: URLComponents
    init(components: URLComponents = URLComponents()) {
        self.components = components
        self.components.scheme = "https"
        self.components.host = "api.thecatapi.com"
    }
    func getRandomCat() -> URL? {
        self.components.path = EndpointBuilder.randomCatPath
        print(components)
        return components.url
    }
    func getCatTags() -> URL? {
        self.components.path = EndpointBuilder.tagPath
        print(components)
        return components.url
    }
}
extension EndpointBuilder {
    static let randomCatPath: String = "/v1/images/search"
    static let imageURL: String = "https://cataas.com/cat"
    static let tagPath: String = "/api/tags"
}
