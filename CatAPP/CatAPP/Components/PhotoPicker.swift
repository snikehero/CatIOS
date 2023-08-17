//
//  PhotoPicker.swift
//  CatAPP
//
//  Created by Moises Lopez on 17/08/23.
//

import SwiftUI

struct PhotoPicker: View {
    fileprivate typealias PickerConstants = Constants.PhotoPicker
    var body: some View {
        Button {
        } label: {
            Image(systemName: "plus")
                .resizable()
                .clipped()
                .frame(width: PickerConstants.placeholderFrameWidth,
                       height: PickerConstants.placeholderFrameHeight,
                       alignment: .center)
                .clipShape(Circle())
        }
    }
}

struct PhotoPicker_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPicker()
    }
}
