//
//  ShowCatDetailsView.swift
//  CatAPP
//
//  Created by Moises Lopez on 22/08/23.
//

import SwiftUI

struct ShowCatDetailsView: View {
    @ObservedObject var petViewModel : CatDetailViewModel
    fileprivate typealias DetailsConstants = Constants.Details
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    @State var petName: String = ""
    @State var petAge: Int = 0
    @State var petAppointment: Date = Date.now
    @State var petBreed: String = ""
    @State var isEditable = true
    @Binding var identifier: String
    @State var singlePet = PetDetail.mockJojo
    @State var isEditingState = true

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
                    .disabled(isEditable)
                    .autocorrectionDisabled()
                    Picker(DetailsConstants.ageForm, selection: $petAge) {
                        ForEach(0 ..< 20) {
                            Text("\($0) \(DetailsConstants.ageLabel)")
                        }
                    }
                    .disabled(isEditable)
                    TextField(DetailsConstants.breedForm,
                              text: $petBreed)
                    .disabled(isEditable)
                    .autocorrectionDisabled()
                    DatePicker(selection: $petAppointment, in: Date.now...,
                               displayedComponents: .date) {
                        Text(DetailsConstants.dateForm)
                    }
                               .disabled(isEditable)
                }
                Section(header: Text(DetailsConstants.vaccineSection)) {
                    VaccineFormView()
                }
            }
            .onAppear {
                singlePet = petViewModel.searchById(arrayOfPets: petViewModel.pets,
                                                    identifier: identifier)
                fillData(singlePet: singlePet)
            }
            .toolbar {
                if isEditingState {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isEditable.toggle()
                            isEditingState.toggle()
                        } label: {
                            Text("Edit")
                        }

                    }
                } else {
                    ToolbarItem(placement: .navigationBarTrailing ) {
                        Button {
                            isEditingState.toggle()
                            isEditable.toggle()
                        } label: {
                            Text("Save")
                        }
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
    func fillData(singlePet: PetDetail) {
        petName = singlePet.name
        petBreed = singlePet.breed
        petAge = singlePet.petYear
        petAppointment = singlePet.appointment
    }
}

struct ShowCatDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowCatDetailsView(petViewModel: CatDetailViewModel(), identifier: .constant("123"))
    }
}
