//
//  ShowCatDetailsView.swift
//  CatAPP
//
//  Created by Moises Lopez on 22/08/23.
//

import SwiftUI

struct ShowCatDetailsView: View {
    @ObservedObject var catListViewModel: CatListViewModel
    @StateObject var petViewModel: UpdateCatViewModel
    fileprivate typealias DetailsConstants = Constants.Details
    @Environment(\.dismiss) var dismiss
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
                    .disabled(petViewModel.isEditable)
                    .autocorrectionDisabled()
                    Picker(DetailsConstants.ageForm, selection: $petViewModel.petAge) {
                        ForEach(DetailsConstants.minimumAge ..< DetailsConstants.maximumAge) {
                            Text("\($0) \(DetailsConstants.ageLabel)")
                        }
                    }
                    .disabled(petViewModel.isEditable)
                    Picker(DetailsConstants.breedForm, selection: $petViewModel.petBreed) {
                        ForEach(CatBreed.allCases) { breed in
                            Text(breed.rawValue).tag(breed)
                        }
                    }
                    .disabled(petViewModel.isEditable)
                    DatePicker(selection: $petViewModel.petAppointment, in: Date.now...,
                               displayedComponents: .date) {
                        Text(DetailsConstants.dateForm)
                    }
                               .disabled(petViewModel.isEditable)
                }
                Section(header: Text(DetailsConstants.vaccineSection)) {
                    ForEach(0..<petViewModel.singlePet.vaccines.count, id: \.self) { index in
                        VStack {
                            Text(petViewModel.singlePet.vaccines[index].vaccineName)
                            Text(petViewModel.singlePet.vaccines[index].vaccineDate
                                .formatted(.dateTime.day().month().year()))
                                .font(.system(size: DetailsConstants.dateFontSize))
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .onAppear {
                petViewModel.createSingleCat()
                petViewModel.fillData(singlePet: petViewModel.singlePet)
            }
            .toolbar {
                if petViewModel.isEditingState {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            petViewModel.isEditable.toggle()
                            petViewModel.isEditingState.toggle()
                        } label: {
                            Text(DetailsConstants.editButton)
                        }

                    }
                } else {
                    ToolbarItem(placement: .navigationBarTrailing ) {
                        Button {
                            petViewModel.isEditingState.toggle()
                            petViewModel.isEditable.toggle()
                            petViewModel.updateModel(singlePet: petViewModel.singlePet)
                            petViewModel.updateToCoreData(singlePet: petViewModel.singlePet)
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

}

struct ShowCatDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowCatDetailsView(catListViewModel: CatListViewModel(),
                           petViewModel: UpdateCatViewModel(
                            catListViewModel: CatListViewModel(),
                            identifier: "123"))
    }
}
