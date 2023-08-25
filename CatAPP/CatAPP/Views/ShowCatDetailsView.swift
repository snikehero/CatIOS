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
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    @State var petName: String = ""
    @State var petAge: Int = 0
    @State var petAppointment: Date = Date.now
    @State var petBreed: String = ""
    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    Spacer()
                    PhotoPicker()
                    Spacer()
                }
                Section(header: Text(DetailsConstants.detailsSection)) {
                    TextField(DetailsConstants.nameForm,
                              text: $petName)
                    Picker(DetailsConstants.ageForm, selection: $petAge) {
                        ForEach(0 ..< 20) {
                            Text("\($0) \(DetailsConstants.ageLabel)")
                        }
                    }
                    TextField(DetailsConstants.breedForm,
                              text: $petBreed)
                    DatePicker(selection: $petAppointment, in: Date.now...,
                               displayedComponents: .date) {
                        Text(DetailsConstants.dateForm)
                    }
                }
                Section(header: Text(DetailsConstants.vaccineSection)) {
                    VaccineFormView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAlert = true
                    } label: {
                        Text("Edit")
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

struct ShowCatDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowCatDetailsView(singlePet: PetDetail.mockJojo)
    }
}
