//
//  CatDetailsView.swift
//  CatAPP
//
//  Created by Moises Lopez on 17/08/23.
//

import SwiftUI
import PhotosUI

struct CatDetailsView: View {
    fileprivate typealias DetailsConstants = Constants.Details
    @Environment(\.dismiss) var dismiss

    @State var petName: String = ""
    @State var petAge: String = ""
    @State var petAppointment: Date = Date.now
    @State var petBreed: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text(DetailsConstants.detailsSection)) {
                    TextField(DetailsConstants.nameForm,
                              text: $petName)
                    TextField(DetailsConstants.ageForm,
                              text: $petAge)
                    TextField(DetailsConstants.breedForm,
                              text: $petBreed)
                    DatePicker(selection: $petAppointment, in: Date.now...,
                                displayedComponents: .date) {
                        Text(DetailsConstants.dateForm)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                    } label: {
                        Text(DetailsConstants.saveButton)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text(DetailsConstants.cancelButton)
                    }
                }
            }
        }
    }
}

struct CatDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CatDetailsView(petAppointment: Date())
    }
}
