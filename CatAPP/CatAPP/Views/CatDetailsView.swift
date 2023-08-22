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
    @State var petBreed: String = ""
    @State private var showingAlert = false
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
            .alert(DetailsConstants.alertMessage, isPresented: $showingAlert) {
                Button(DetailsConstants.alertButton, role: .cancel) {
                    dismiss()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        petViewModel.saveData(name: petName,
                                              petAge: petAge,
                                              appointment: petAppointment,
                                              breed: petBreed)
                        showingAlert = true
                        petViewModel.coreDataManager.saveCat(name: petName, year: petAge,
                                                appointment: petAppointment, breed: petBreed)
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
        CatDetailsView(petViewModel: CatDetailViewModel(), petAppointment: Date())
    }
}
