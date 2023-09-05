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
    @State var petVaccines: [String] = []
    @State var petVaccinesDate: [Date] = []
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
                        ForEach(DetailsConstants.minimumAge ..< DetailsConstants.maximumAge) {
                            Text("\($0) \(DetailsConstants.ageLabel)")
                        }
                    }
                    .disabled(isEditable)
                    Picker(DetailsConstants.breedForm, selection: $petBreed) {
                        ForEach(CatBreed.allCases) { breed in
                            Text(breed.rawValue).tag(breed)
                        }
                    }
                    .disabled(isEditable)
                    DatePicker(selection: $petAppointment, in: Date.now...,
                               displayedComponents: .date) {
                        Text(DetailsConstants.dateForm)
                    }
                               .disabled(isEditable)
                }
                Section(header: Text("Vaccines")) {
                    ForEach(0..<singlePet.vaccines.count, id: \.self) { index in
                        VStack {
                            Text(singlePet.vaccines[index].vaccineName)
                            Text(singlePet.vaccines[index].vaccineDate.formatted())
                                .font(.system(size: 18))
                                .foregroundColor(.secondary)
                        }
                    }
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
                            Text(DetailsConstants.editButton)
                        }

                    }
                } else {
                    ToolbarItem(placement: .navigationBarTrailing ) {
                        Button {
                            isEditingState.toggle()
                            isEditable.toggle()
                            updateModel(singlePet: singlePet)
                            petViewModel.updateToCoreData(singlePet: singlePet, identifier: singlePet.id)
                        } label: {
                            Text(DetailsConstants.saveButton)
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
    func updateModel(singlePet: PetDetail) {
        self.singlePet.name = petName
        self.singlePet.breed = petBreed
        self.singlePet.petYear = petAge
        self.singlePet.appointment = petAppointment
    }
}

struct ShowCatDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowCatDetailsView(petViewModel: CatDetailViewModel(), identifier: .constant("123"))
    }
}
