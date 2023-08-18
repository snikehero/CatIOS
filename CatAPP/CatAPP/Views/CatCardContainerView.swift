//
//  CatCardContainerView.swift
//  CatAPP
//
//  Created by Moises Lopez on 18/08/23.
//

import SwiftUI

struct CatCardContainerView: View {
    var body: some View {
        Form {
            CatCardView()
            CatCardView()
            CatCardView()
            CatCardView()
            CatCardView()
            CatCardView()
            CatCardView()
            CatCardView()
        }
    }
}

struct CatCardContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CatCardContainerView()
    }
}
