//
//  CatCardContainerView.swift
//  CatAPP
//
//  Created by Moises Lopez on 18/08/23.
//

import SwiftUI

struct CatCardContainerView: View {
    var pets: [Int]
    var body: some View {
        List(pets, id: \.self) { _ in
            CatCardView()
        }
    }
}

struct CatCardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CatCardContainerView(pets: (1...10).map {$0})
    }
}
