//
//  CoreDataUsageView.swift
//  CatAPP
//
//  Created by Moises Lopez on 21/08/23.
//

import SwiftUI

struct CoreDataUsageView: View {
    let coreDataManager = CoreDataManager(modelName: "CatAPP")
    var body: some View {
        VStack {
            Button {
                coreDataManager.createDefaultItem()
            } label: {
                Text("Create Cat")
            }
        }
        .onAppear {
            coreDataManager.load()
        }
    }
}

struct CoreDataUsageView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataUsageView()
    }
}
