//
//  NoItemsView.swift
//  ToDo
//
//  Created by Julia Sikorski on 03.12.23.
//

import SwiftUI

struct NoItemsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("Noch keine Einträge!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Um einen Eintrag hinzuzufügen, klicke auf \"Neuer Eintrag\" in der oberen rechten Ecke.")
            }
            .multilineTextAlignment(.center)
            .padding(30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("Title")
    }
    
}
