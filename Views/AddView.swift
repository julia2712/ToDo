//
//  AddView.swift
//  ToDo
//
//  Add a new thing to the ToDo List
//
//  Created by Julia Sikorski on 02.12.23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    let textFieldBG = Color(red: 0.9, green: 0.9, blue: 0.9)
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Tippe hier etwas ein ...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(textFieldBG)
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Speichern")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: 150)
                        .background(Color.teal)
                        .cornerRadius(10)
                })
            }
            .padding(15)
        }
        .navigationTitle("Eintrag hinzufügen")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsAppropriate() == true {
            listViewModel.addItem(title: textFieldText)
            // go one back in the hierarchy
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Der Eintrag muss mindestens 3 Buchstaben lang sein"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }
}
