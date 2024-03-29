//
//  Constants.swift
//  CatAPP
//
//  Created by Moises Lopez on 16/08/23.
//

import Foundation
import SwiftUI

enum Constants {
    enum CatCard {
       public static let cardCornerRadius = CGFloat(20)
        public static let cardShadow = CGFloat(10)
        public static let spacing = CGFloat(10)
        public static let ageLabel = "Age: "
        public static let breedLabel = "Breed: "
        public static let appointmentLabel = "Appointment: "
        public static let defaultName = "Cat"
        public static let defaultAge = "7"
        public static let defaultBreed = "Callejero"
        public static let defaultAppointment = " 15 Octubre"
        public static let padding = CGFloat(20)
        public static let cardWidth = CGFloat(600)
        public static let cardHeight = CGFloat(150)
    }
    enum TabNavigation {
        public static let catLabel = "Cat"
        public static let catTabImage = "doc"
        public static let randomLabel = "Random"
        public static let catRandomImage = "magazine"
        public static let searchLabel = "Search"
        public static let searchImage = "magnifyingglass"
        public static let infiniteLabel = "Infinite Scrolling"
        public static let infiniteImage = "infinity"
    }
    enum CatView {
        public static let plusIcon = Image(systemName: "plus")
        public static let createPetLabel = "Tap to add a cat"
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
        public static let vaccineSection = "Vaccines"
        public static let ageLabel = " Years"
        public static let alertMessage = "Data has been saved."
        public static let alertButton = "Ok"
        public static let editButton = "Edit"
        public static let minimumAge = Int(0)
        public static let maximumAge = Int(25)
        public static let appointmentSection = "Appointment"
        public static let createVaccineLabel = "Add new vaccine"
        public static let vaccineSectionLabel = "Vaccines"
        public static let vaccinePickerLabel = "Vaccine"
        public static let vaccineDatePickerLabel = "Vaccine date"
        public static let dateFontSize = CGFloat(18)
    }
    enum PhotoPicker {
        public static let placeholderFrameWidth = CGFloat(100)
        public static let placeholderFrameHeight = CGFloat(100)
    }
    enum RandomCat {
        public static let reloadButton = "Reload"
        public static let photoFrameWidth = CGFloat(500)
        public static let photoFrameHeight = CGFloat(300)
        public static let photoFrameRadius = CGFloat(30)
    }
    enum NetworkMonitorConstants {
        public static let networkMonitor = "NetworkMonitor"
        public static let networkMonitorMock = "MockNetworkMonitor"
        public static let networkMonitorStatus = "NetworkMonitor status:"
    }
    enum NoNetwork {
        public static let noNetworkTitle = "Cats not available"
        public static let noNetworkDescription = "The Cat app has no internet connection."
        public static let noNetworkTopPading = CGFloat(100)
        public static let noNetworkLeading = CGFloat(10)
        public static let noNetworkBottomPading = CGFloat(100)
        public static let noNetworkTrailing = CGFloat(10)
        public static let noNetworkString = "wifi.slash"
        public static let networkImageSystemSyze = CGFloat(30)
        public static let DescriptionNoNetworkImage = Image("NetworkImage")
    }
    enum CardContainer {
        public static let frameMaxWidth = CGFloat(700)
    }
    enum InfiniteScrolling {
        public static let TagsPerPage = 20
        public static let scrollThreshold = CGFloat(100.0)
        public static let backgroundOpacity = CGFloat(0.2)
        public static let allTextLoaded = "All tags have been loaded"

    }
}
