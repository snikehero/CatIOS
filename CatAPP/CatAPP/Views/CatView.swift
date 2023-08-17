//
//  CatView.swift
//  CatAPP
//
//  Created by Moises Lopez on 16/08/23.
//

import SwiftUI

struct CatView: View {
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
                                    Constants.CatView.plusIcon
                                }
                            }
                        }
                } else {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Text("\(Constants.CatView.plusIcon) \(Constants.CatView.createPetLabel)")
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
