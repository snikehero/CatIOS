//
//  InfiniteScrollingView.swift
//  CatAPP
//
//  Created by Moises Lopez on 01/09/23.
//

import SwiftUI

struct InfiniteScrollingView: View {
    @ObservedObject var catViewModel: CatDetailViewModel
    private let scrollThreshold: CGFloat = 100.0
    private var allTagsLoaded: Bool {
        return catViewModel.visibleTags.count == catTags.count
    }

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(catViewModel.visibleTags, id: \.self) { eachTag in
                    ListItem(singleTag: eachTag)
                }
                if !allTagsLoaded {
                    ProgressView()
                        .onAppear(perform: catViewModel.loadMoreTags)
                } else {
                    Text("All tags have been loaded.")
                        .padding()
                }
            }
        }
        .onAppear(perform: catViewModel.loadInitialTags)
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
