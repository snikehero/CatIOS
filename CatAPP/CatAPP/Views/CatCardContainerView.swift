//
//  CatCardContainerView.swift
//  CatAPP
//
//  Created by Moises Lopez on 18/08/23.
//

import SwiftUI

struct CatCardContainerView: View {
    var pets: [PetDetail]
    var body: some View {
        List {
            ForEach(pets) { singlePet in
                CatCardView(singlePet: singlePet)
            }
        }
    }
}

struct CatCardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CatCardContainerView(pets: CatDetailViewModel.petsMock)
    }
}
