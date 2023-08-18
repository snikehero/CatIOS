//
//  CatCardView.swift
//  CatAPP
//
//  Created by Moises Lopez on 18/08/23.
//

import SwiftUI

struct CatCardView: View {
    fileprivate typealias CardConstants = Constants.CatCard
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: CardConstants.cardCornerRadius, style: .continuous)
                .fill(.white)
                .shadow(radius: CardConstants.cardShadow)
            HStack(spacing: CardConstants.spacing) {
                Text("Pitt")
                    .font(.largeTitle)
                Spacer()
                VStack {
                    CardDetailText(label: CardConstants.ageLabel,
                                   content: CardConstants.defaultAge)
                    Spacer()
                    CardDetailText(label: CardConstants.breedLabel,
                                   content: CardConstants.defaultBreed)
                    Spacer()
                    CardDetailText(label: CardConstants.appointmentLabel,
                                   content: CardConstants.defaultAppointment)
                }
            }
            .padding(CardConstants.padding)
            .multilineTextAlignment(.center)
        }
        .frame(width: CardConstants.cardWidth, height: CardConstants.cardHeight)
    }
}
struct CatCardView_Previews: PreviewProvider {
    static var previews: some View {
        CatCardView()
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
