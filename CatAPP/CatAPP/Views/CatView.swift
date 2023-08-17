//
//  CatView.swift
//  CatAPP
//
//  Created by Moises Lopez on 16/08/23.
//

import SwiftUI

struct CatView: View {
    fileprivate typealias CatConstants = Constants.CatView

    @State private var showingSheet = false
    private var petIsCreatedState = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(Constants.Color.mainBackgroundColor)
                if petIsCreatedState {
                    Text("Cat View")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button {
                                    showingSheet.toggle()
                                } label: {
                                    CatConstants.plusIcon
                                }
                            }
                        }
                } else {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Text("\(CatConstants.plusIcon) \(CatConstants.createPetLabel)")
                    }
                }
            }
        }
        .sheet(isPresented: $showingSheet) {
            EmptyView()
        }
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        CatView()
    }
}
