//
//  CatDetailsView.swift
//  CatAPP
//
//  Created by Moises Lopez on 17/08/23.
//

import SwiftUI

struct CatDetailsView: View {
    @Environment(\.dismiss) var dismiss
    @State var username: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Section 1")) {
                    TextField("Username",
                              text: $username)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                    } label: {
                        Text("Save")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

struct CatDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CatDetailsView()
    }
}
