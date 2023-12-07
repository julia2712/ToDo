//
//  ListRowView.swift
//  ToDo
//
//  Created by Julia Sikorski on 02.12.23.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
            Text(item.title)
            Spacer()
        }
        .font(.title2)
    }
}


struct ListRowView_Previews: PreviewProvider{
    static var item1 = ItemModel(title: "first", isCompleted: false)
    static var item2 = ItemModel(title: "second", isCompleted: true)
    
    static var previews: some View{
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
    }
    
}

