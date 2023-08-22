//
//  CoreDataUsageView.swift
//  CatAPP
//
//  Created by Moises Lopez on 21/08/23.
//

import SwiftUI

struct CoreDataUsageView: View {

    var body: some View {
        VStack {
            Button {
                CoreDataManager.shared.createDefaultItem()
            } label: {
                Text("Create Cat")
            }
        }
    }
}

struct CoreDataUsageView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataUsageView()
    }
}
