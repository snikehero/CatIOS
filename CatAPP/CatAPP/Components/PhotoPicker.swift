//
//  PhotoPicker.swift
//  CatAPP
//
//  Created by Moises Lopez on 17/08/23.
//

import SwiftUI

struct PhotoPicker: View {
    var body: some View {
        Button {
        } label: {
            Image(systemName: "plus")
                .resizable()
                .clipped()
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(Circle())
        }
    }
}

struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker()
    }
}
