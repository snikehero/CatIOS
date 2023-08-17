//
//  CatView.swift
//  CatAPP
//
//  Created by Moises Lopez on 16/08/23.
//

import SwiftUI

struct CatView: View {
    @State private var showingSheet = false
    private var catExist = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.red)
                Text("Cat View")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                showingSheet.toggle()
                            } label: {
                                Image(systemName: "plus")
                            }
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
