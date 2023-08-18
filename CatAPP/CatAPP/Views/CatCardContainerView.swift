//
//  CatCardContainerView.swift
//  CatAPP
//
//  Created by Moises Lopez on 18/08/23.
//

import SwiftUI

struct CatCardContainerView: View {
    var pets = Array(repeating: 0, count: 10)
    var body: some View {
        List(pets, id: \.self) { onePet in
            CatCardView()
        }
    }
}

struct CatCardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CatCardContainerView()
    }
}
