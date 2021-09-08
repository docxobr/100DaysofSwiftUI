//
//  ContentView.swift
//  WeSplit
//
//  Created by Douglas Bridi Rosa on 07/09/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 0
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalFinal: Double{
        let tipSelection = Double(tipPercentages[tipPercentage])
        
        let orderAmount = Double(checkAmount) ?? 0
    
        let tipValue = orderAmount / 100 * tipSelection
        
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        
        let amountPerPeople = totalFinal / peopleCount
        
        return amountPerPeople
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Valor final",text:$checkAmount)
                        .keyboardType(.decimalPad)
                    Picker("Pessoas", selection: $numberOfPeople){
                        ForEach ( 2 ..< 100){
                            Text("\($0) pessoas")
                        }
                    }
                }
                
                Section(header: Text("Gorjeta")){
                    Picker("Gorjeta", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Valor total com gorjeta")){
                    Text("R$ \(totalFinal, specifier: "%.2f")")
                }
                
                Section(header: Text("Valor por pessoa")){
                    Text("R$ \(totalPerPerson, specifier: "%.2f")")
                }
            }.navigationBarTitle("Racha a conta")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
