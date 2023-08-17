//
//  Constants.swift
//  CatAPP
//
//  Created by Moises Lopez on 16/08/23.
//

import Foundation
import SwiftUI

enum Constants {
    enum TabNavigation {
        public static let catLabel = "Cat"
        public static let catTabImage = "doc"
        public static let randomLabel = "Random"
        public static let catRandomImage = "magazine"
    }
    enum CatView {
        public static let plusIcon = Image(systemName: "plus")
        public static let createPetLabel = "Tap to add a pet"
    }
    enum Color {
        public static let mainBackgroundColor = "BackgroundColor"
    }
    enum Details {
        public static let cancelButton = "Cancel"
        public static let saveButton = "Save"
        public static let detailsSection = "Cat Details"
        public static let nameForm = "Name"
        public static let ageForm = "Age"
        public static let breedForm = "Breed"
        public static let dateForm = "Date"
    }
}
