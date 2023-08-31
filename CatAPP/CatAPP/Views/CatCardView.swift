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
    @ObservedObject var catViewModel: CatDetailViewModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: CardConstants.cardCornerRadius, style: .continuous)
                .fill(.white)
                .shadow(radius: CardConstants.cardShadow)
                HStack(spacing: CardConstants.spacing) {
                    CardNameText(name: singlePet.name)
                    Spacer()
                    VStack(alignment: .leading) {
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
        .frame(maxWidth: CardConstants.cardWidth, maxHeight: CardConstants.cardHeight)
    }

}
struct CatCardView_Previews: PreviewProvider {
    static var previews: some View {
        CatCardView(singlePet: PetDetail.mockJojo, catViewModel: CatDetailViewModel())
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
        Text(label).font(.system(size: 18, weight: .bold)) + Text(content).font(.system(size: 16, weight: .regular))
    }
}
