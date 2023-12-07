//
//  ContentView.swift
//  WeSplit
//
//  Created by R R on 16/03/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double{
        
        let convertedToInt = Int(numberOfPeople) ?? 0
        let peopleCount = Double(convertedToInt)
        
        //let peopleCount = Double(numberOfPeople + 2)   old code

        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerson = grandTotal / peopleCount
        
        return amountPerson
    }
    
    //challenge
    var amountforcheck: Double{
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView{
        Form{
            Section{
                TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
                
//                Picker("Number Of People", selection: $numberOfPeople) {
//                    ForEach(2 ..< 100){
//                        Text("\($0) people")
//                    }
//                }
                
                //challenge
                TextField("Number Of People", text: $numberOfPeople)
                    .keyboardType(.numberPad)
                        
            }
            
            Section(header: Text("How much tip do you want to leave?")){
                Picker("Tip Percentage", selection: $tipPercentage) {
                    ForEach(0 ..< tipPercentages.count){
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            //challenge
            Section(header: Text("Amount for the check")){
                Text("$\(amountforcheck, specifier: "%.2f")")
                    .foregroundColor(tipPercentage == 4 ? .red : .primary) //challenge from project3
            }
            
            Section(header: Text("Amount per person")){
                Text("$\(totalPerPerson, specifier: "%.2f")")
            }
            
        }
        .navigationTitle("WeSplit")
      }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
