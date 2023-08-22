//
//  ShowCatDetailsView.swift
//  CatAPP
//
//  Created by Moises Lopez on 22/08/23.
//

import SwiftUI

struct ShowCatDetailsView: View {
    let singlePet: PetDetail
    fileprivate typealias DetailsConstants = Constants.Details
    var body: some View {
        Form {
            HStack {
                Spacer()
                PhotoPicker()
                Spacer()
            }
            Section(header: Text(DetailsConstants.detailsSection)) {
                Text(singlePet.name)
                Text(singlePet.breed)
                Text(singlePet.petYear.description)
                Text(singlePet.appointment.description)
            }
            Section(header: Text(DetailsConstants.vaccineSection)) {
                VaccineFormView()
            }
        }
    }
}

struct ShowCatDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowCatDetailsView(singlePet: PetDetail.mockJojo)
    }
}
