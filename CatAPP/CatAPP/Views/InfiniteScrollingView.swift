//
//  InfiniteScrollingView.swift
//  CatAPP
//
//  Created by Moises Lopez on 01/09/23.
//

import SwiftUI

struct InfiniteScrollingView: View {
    @State private var visibleTags: [String] = []
    @ObservedObject var catViewModel: CatDetailViewModel
    private let tagsPerPage = 20
    private let scrollThreshold: CGFloat = 100.0
    private var allTagsLoaded: Bool {
        return visibleTags.count == catTags.count
    }

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(visibleTags, id: \.self) { eachTag in
                    ListItem(singleTag: eachTag)
                }
                if !allTagsLoaded {
                    ProgressView()
                        .onAppear(perform: loadMoreTags)
                } else {
                    Text("All tags have been loaded.")
                        .padding()
                }
            }
        }
        .onAppear(perform: loadInitialTags)
    }

    private func loadInitialTags() {
        visibleTags = Array(catTags.prefix(tagsPerPage))
    }

    private func loadMoreTags() {
        let startIndex = visibleTags.count
        let endIndex = min(startIndex + tagsPerPage, catTags.count)

        if startIndex < endIndex {
            let newTags = Array(catTags[startIndex..<endIndex])
            visibleTags.append(contentsOf: newTags)
        }
    }
}
struct InfiniteScrollingView_Previews: PreviewProvider {
    static var previews: some View {
        InfiniteScrollingView(catViewModel: CatDetailViewModel())
    }
}

struct ListItem: View {
    var singleTag: String

    var body: some View {
        HStack {
            Text(singleTag)
                .padding()
            Spacer()
        }
        .background(Color.gray.opacity(0.2))
    }
}
