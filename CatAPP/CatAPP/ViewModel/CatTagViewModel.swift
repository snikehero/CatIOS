//
//  CatTagViewModel.swift
//  CatAPP
//
//  Created by Moises Lopez on 04/09/23.
//

import Foundation

@MainActor class CatTagViewModel: ObservableObject {
    @Published var visibleTags: [String] = []
    @Published var allTags: CatTagModel = CatTagModel.mock
    let networkManager: NetworkManager
    let endpointBuilder: EndpointBuilder

    var allTagsLoaded: Bool {
        return visibleTags.count == catTags.count
    }
    private let tagsPerPage = Constants.InfiniteScrolling.TagsPerPage
    init(networkManager: NetworkManager, endpointBuilder: EndpointBuilder) {

        self.networkManager = networkManager
        self.endpointBuilder = endpointBuilder
    }

    func loadInitialTags() {
        visibleTags = Array(catTags.prefix(tagsPerPage))
    }

    func loadMoreTags() {
        let startIndex = visibleTags.count
        let endIndex = min(startIndex + tagsPerPage, catTags.count)

        if startIndex < endIndex {
            let newTags = Array(catTags[startIndex..<endIndex])
            visibleTags.append(contentsOf: newTags)
        }
    }
    func fetchAllTags() {
        networkManager.fetchData(
            endpoint: endpointBuilder.getCatTags(),
            type: CatTagModel.self) { catTag in
                if let catTag = catTag {
                    DispatchQueue.main.async { [weak self] in
                        self?.allTags = catTag
                    }
                }
            }
    }
}
