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
    @ObservedObject var petViewModel : CatDetailViewModel
    @State var petName: String = ""
    @State var petAge: Int = 0
    @State var petAppointment: Date = Date.now
    @State var petBreed: String = CatBreed.abyssinian.rawValue
    @State private var showingAlert = false
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
                    .autocorrectionDisabled()
                    Picker(DetailsConstants.ageForm, selection: $petAge) {
                        ForEach(DetailsConstants.minimumAge ..< DetailsConstants.maximumAge) {
                            Text("\($0) \(DetailsConstants.ageLabel)")
                        }
                    }
                    Picker(DetailsConstants.breedForm, selection: $petBreed) {
                        ForEach(CatBreed.allCases) { breed in
                            Text(breed.rawValue).tag(breed)
                        }
                    }
                    DatePicker(selection: $petAppointment, in: Date.now...,
                               displayedComponents: .date) {
                        Text(DetailsConstants.dateForm)
                    }
                }
                Button {
                    createNewVaccine()
                } label: {
                    Text("Add New Vaccine")
                }
                Section(header: Text("Vaccines")) {
                    ForEach(0..<petVaccines.count, id: \.self) { index in
                        VStack {
                            Picker("Vaccine", selection: $petVaccines[index]) {
                                ForEach(CatVaccine.allCases) { vaccine in
                                    Text(vaccine.rawValue).tag(vaccine)
                                }
                            }
                            DatePicker(selection: $petVaccinesDate[index], in: Date.now...,
                                       displayedComponents: .date) {
                                Text("Vaccine Date")
                            }
                        }
                    }
                }
            }
            .alert(DetailsConstants.alertMessage, isPresented: $showingAlert) {
                Button(DetailsConstants.alertButton, role: .cancel) {
                    dismiss()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addToModel()
                        petViewModel.saveData(name: petName,
                                              petAge: petAge,
                                              appointment: petAppointment,
                                              breed: petBreed
                                              )

                        showingAlert = true
                    } label: {
                        Text(DetailsConstants.saveButton)
                    }
                    .disabled(petName.isEmpty || petBreed.isEmpty)
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
    func createNewVaccine() {
        petVaccines.append("")
        petVaccinesDate.append(Date())
    }
    func addToModel() {
        for index in petVaccines.enumerated() {
            let vaccineName = petVaccines[index.offset]
            let vaccineDate = petVaccinesDate[index.offset]
            let petVaccineModel = PetVaccineModel(vaccineName: vaccineName, vaccineDate: vaccineDate)
            petViewModel.vaccines.append(petVaccineModel)
        }
    }
}

struct CatDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CatDetailsView(petViewModel: CatDetailViewModel(), petAppointment: Date())
    }
}
