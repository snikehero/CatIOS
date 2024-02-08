//
//  NoInternetView.swift
//  CatAPP
//
//  Created by Moises Lopez on 29/08/23.
//

import SwiftUI

struct NoInternetView: View {
    @State private var isShowingAlert = false
    var body: some View {
        ZStack {
            Color(Constants.Color.mainBackgroundColor)
            VStack {
                NoNetworkTitle()
                NoInternetDescription()
                NoInternetImage()
            }
        }
    }
}

struct NoInternetView_Previews: PreviewProvider {
    static var previews: some View {
        NoInternetView()
    }
}
struct NoInternetDescription: View {
    var body: some View {
        Text(Constants.NoNetwork.noNetworkDescription)
            .font(.body)
            .multilineTextAlignment(.center)
    }
}
struct NoNetworkTitle: View {
    var body: some View {
        Text(Constants.NoNetwork.noNetworkTitle)
            .font(.title2)
            .bold()
            .padding()
    }
}
struct NoInternetImage: View {
    var body: some View {
        Image("NoInternetCat")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    }
}
