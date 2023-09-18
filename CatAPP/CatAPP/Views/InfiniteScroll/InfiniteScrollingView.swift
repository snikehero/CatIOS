//
//  InfiniteScrollingView.swift
//  CatAPP
//
//  Created by Moises Lopez on 01/09/23.
//

import SwiftUI

struct InfiniteScrollingView: View {
    @ObservedObject var tagViewModel: CatTagViewModel
    private let scrollThreshold: CGFloat = Constants.InfiniteScrolling.scrollThreshold

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(tagViewModel.visibleTags, id: \.self) { eachTag in
                    ListItem(singleTag: eachTag)
                }
                if !tagViewModel.allTagsLoaded {
                    ProgressView()
                        .onAppear(perform: tagViewModel.loadMoreTags)
                } else {
                    Text(Constants.InfiniteScrolling.allTextLoaded)
                        .padding()
                }
            }
        }
        .onAppear(perform: tagViewModel.loadInitialTags)
        .onAppear(perform: tagViewModel.fetchAllTags)
    }

}
struct InfiniteScrollingView_Previews: PreviewProvider {
    static var previews: some View {
        InfiniteScrollingView(
            tagViewModel: CatTagViewModel(
                networkManager: NetworkManager(),
                endpointBuilder: EndpointBuilder()
            )
        )
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
        .background(Color.gray.opacity(Constants.InfiniteScrolling.backgroundOpacity))
    }
}
