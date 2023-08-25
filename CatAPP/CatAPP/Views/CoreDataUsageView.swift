//
//  CoreDataUsageView.swift
//  CatAPP
//
//  Created by Moises Lopez on 21/08/23.
//

import SwiftUI

struct CoreDataUsageView: View {
    @State var pets: [Cat] = []

    var body: some View {
        VStack {
            Button {
                pets = CoreDataManager.shared.fetch()
            } label: {
                Text("Create Cat")
            }
            List(pets) { singlePet in
                Text(singlePet.name )
            }
        }
    }
}

struct CoreDataUsageView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataUsageView()
    }
}
