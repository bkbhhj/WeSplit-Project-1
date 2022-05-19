//
//  ContentView.swift
//  WeSplit Project 1
//
//  Created by Павел Тимофеев on 08.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocus: Bool

let tipPercentages = [10, 15, 20, 25, 0]
  
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    // chalenge 2
    
    var grandTotal: Double {
        
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
                NavigationView {
Form {
            Section {
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD")).keyboardType(.decimalPad).focused($amountIsFocus)
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2..<100) {
                        Text("\($0) people")
                    }
                }
            }
    Section {
       // chalenge 3
        Picker("Tip percentage", selection: $tipPercentage) {
            ForEach(0..<101, id: \.self) {
                Text($0, format: .percent)
            }
        }.pickerStyle(.automatic)
        
    } header: {
        Text("How much tip do you want to leave?")
    }
    
    Section {
        Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
    }
// chalenge 1
header: {
        Text("Amount per person")
    }
       
// chalenge 2
    Section {
        Text(grandTotal,  format: .currency(code: Locale.current.currencyCode ?? "USD"))
    } header: {
        Text ("Total price")
    }
}
                }.navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Ok") {
                        
                        amountIsFocus = false
                    }
                }
            }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
