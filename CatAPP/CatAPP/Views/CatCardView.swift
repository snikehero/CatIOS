//
//  CatCardView.swift
//  CatAPP
//
//  Created by Moises Lopez on 18/08/23.
//

import SwiftUI

struct CatCardView: View {
    fileprivate typealias CardConstants = Constants.CatCard
    var singlePet: PetDetail
    @State private var isPresented = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: CardConstants.cardCornerRadius, style: .continuous)
                .fill(.white)
                .shadow(radius: CardConstants.cardShadow)
            Button {
                isPresented.toggle()
            } label : {
                HStack(spacing: CardConstants.spacing) {
                    CardNameText(name: singlePet.name)
                    Spacer()
                    VStack {
                        CardDetailText(label: CardConstants.ageLabel,
                                       content: singlePet.petYear.description)
                        Spacer()
                        CardDetailText(label: CardConstants.breedLabel,
                                       content: singlePet.breed)
                        Spacer()
                        CardDetailText(label: CardConstants.appointmentLabel,
                                       content: singlePet.appointment.formatted(.dateTime.day().month().year()))
                    }
                }
                .padding(CardConstants.padding)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .frame(width: CardConstants.cardWidth, height: CardConstants.cardHeight)
        .fullScreenCover(isPresented: $isPresented) {
            ShowCatDetailsView(singlePet: singlePet)
        }
    }
    
}
struct CatCardView_Previews: PreviewProvider {
    static var previews: some View {
        CatCardView(singlePet: PetDetail.mockMomo)
    }
}
struct CardNameText: View {
    let name: String

    var body: some View {
        Text(name)
            .font(.largeTitle)
    }
}
struct CardDetailText: View {
    let label: String
    let content: String

    var body: some View {
        HStack {
            Text(label)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(content)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
