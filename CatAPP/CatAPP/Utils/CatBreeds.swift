//
//  CatBreeds.swift
//  CatAPP
//
//  Created by Moises Lopez on 31/08/23.
//

import Foundation
enum CatBreed: String, CaseIterable, Identifiable {
    case abyssinian = "Abyssinian"
    case americanBobtail = "American Bobtail"
    case americanCurl = "American Curl"
    case americanShorthair = "American Shorthair"
    case americanWirehair = "American Wirehair"
    case balinese = "Balinese"
    case bengal = "Bengal"
    case birman = "Birman"
    case bombay = "Bombay"
    case britishShorthair = "British Shorthair"
    case burmese = "Burmese"
    case chartreux = "Chartreux"
    case cornishRex = "Cornish Rex"
    case devonRex = "Devon Rex"
    case egyptianMau = "Egyptian Mau"
    case europeanShorthair = "European Shorthair"
    case exoticShorthair = "Exotic Shorthair"
    case havanaBrown = "Havana Brown"
    case himalayan = "Himalayan"
    case japaneseBobtail = "Japanese Bobtail"
    case javanese = "Javanese"
    case korat = "Korat"
    case laPerm = "LaPerm"
    case maineCoon = "Maine Coon"
    case manx = "Manx"
    case munchkin = "Munchkin"
    case nebelung = "Nebelung"
    case norwegianForest = "Norwegian Forest"
    case ocicat = "Ocicat"
    case orientalShorthair = "Oriental Shorthair"
    case persian = "Persian"
    case ragamuffin = "Ragamuffin"
    case ragdoll = "Ragdoll"
    case russianBlue = "Russian Blue"
    case savannah = "Savannah"
    case scottishFold = "Scottish Fold"
    case selkirkRex = "Selkirk Rex"
    case siamese = "Siamese"
    case siberian = "Siberian"
    case singapura = "Singapura"
    case somali = "Somali"
    case sphynx = "Sphynx"
    case tonkinese = "Tonkinese"
    case turkishAngora = "Turkish Angora"
    case turkishVan = "Turkish Van"
    var id: String {self.rawValue}
}
