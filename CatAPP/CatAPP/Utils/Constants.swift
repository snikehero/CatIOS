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
        public static let ageLabel = "Name: "
        public static let breedLabel = "Breed: "
        public static let appointmentLabel = "Appointment: "
        public static let defaultName = "Cat"
        public static let defaultAge = "7"
        public static let defaultBreed = "Callejero"
        public static let defaultAppointment = " 15 Octubre"
        public static let padding = CGFloat(20)
        public static let cardWidth = CGFloat(350)
        public static let cardHeight = CGFloat(150)
    }
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
}
