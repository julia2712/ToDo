//
//  ListView.swift
//  ToDo
//
//  Created by Julia Sikorski on 02.12.23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List{
                    ForEach(listViewModel.items) { item in
                       ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("ToDo Liste 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Neuer Eintrag", destination: AddView())
        )
    }
}


 
struct ListView_Previews: PreviewProvider{
    static var previews: some View{
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
