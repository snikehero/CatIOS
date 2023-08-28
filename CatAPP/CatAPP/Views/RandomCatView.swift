//
//  RandomCatView.swift
//  CatAPP
//
//  Created by Moises Lopez on 16/08/23.
//

import SwiftUI

struct RandomCatView: View {
    fileprivate typealias CardConstants = Constants.RandomCat
    var body: some View {
        NavigationStack {
            Image("randomCatMock")
                .resizable()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                        } label: {
                            Text(CardConstants.reloadButton)
                        }
                    }
                }
        }

    }
}

struct RandomCatView_Previews: PreviewProvider {
    static var previews: some View {
        RandomCatView()
    }
}
