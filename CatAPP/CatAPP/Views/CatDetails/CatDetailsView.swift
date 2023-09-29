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
    @StateObject var petViewModel: CatDetailViewModel
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
                              text: $petViewModel.petName)
                    .autocorrectionDisabled()
                    Picker(DetailsConstants.ageForm, selection: $petViewModel.petAge) {
                        ForEach(DetailsConstants.minimumAge ..< DetailsConstants.maximumAge) {
                            Text("\($0) \(DetailsConstants.ageLabel)")
                        }
                    }
                    Picker(DetailsConstants.breedForm, selection: $petViewModel.petBreed) {
                        ForEach(CatBreed.allCases) { breed in
                            Text(breed.rawValue).tag(breed)
                        }
                    }
                    DatePicker(selection: $petViewModel.petAppointment, in: Date.now...,
                               displayedComponents: .date) {
                        Text(DetailsConstants.dateForm)
                    }
                }
                Button {
                    petViewModel.createNewVaccine()
                } label: {
                    Text(DetailsConstants.createVaccineLabel)
                }
                Section(header: Text(DetailsConstants.vaccineSectionLabel)) {
                    ForEach(0..<petViewModel.petVaccines.count, id: \.self) { index in
                        VStack {
                            Picker(DetailsConstants.vaccinePickerLabel, selection: $petViewModel.petVaccines[index]) {
                                ForEach(CatVaccine.allCases) { vaccine in
                                    Text(vaccine.rawValue).tag(vaccine)
                                }
                            }
                            DatePicker(selection: $petViewModel.petVaccinesDate[index], in: Date.now...,
                                       displayedComponents: .date) {
                                Text(DetailsConstants.vaccineDatePickerLabel)
                            }
                        }
                    }
                }
            }
            .alert(DetailsConstants.alertMessage, isPresented: $petViewModel.showingAlert) {
                Button(DetailsConstants.alertButton, role: .cancel) {
                    dismiss()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        petViewModel.addToModel()
                        petViewModel.saveData(name: petViewModel.petName,
                                              petAge: petViewModel.petAge,
                                              appointment: petViewModel.petAppointment,
                                              breed: petViewModel.petBreed
                                              )
                        petViewModel.showingAlert = true
                    } label: {
                        Text(DetailsConstants.saveButton)
                    }
                    .disabled(petViewModel.petName.isEmpty || petViewModel.petBreed.isEmpty)
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
        CatDetailsView(petViewModel: CatDetailViewModel(catListViewModel: CatListViewModel(),
                                                        manager: CoreDataManager(modelName: "CatAPP", storeType: StoreTypes.NSInMemoryStoreType)))
    }
}
