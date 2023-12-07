//
//  ContentView.swift
//  WeSplit
//
//  Created by R R on 15/03/2021.
//

import SwiftUI

struct ContentView: View {
    @State private  var tapCount = 0
    @State private  var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationView{
        
//            Form{
//                Section{
//                Text("Hello, world!").padding()
//                Text("Hello, world!").padding()
//                }
//
//                Section{
//                Text("Hello, world!").padding()
//                Text("Hello, world!").padding()
//                }
//            }
            
//            Button("Tap Count \(tapCount)"){
//                self.tapCount += 1
//            }
            
//            Form{
//                TextField("Enter Your Name", text: $name)
//                Text("Your Name \(name)")
//            }
            
            Picker("Select your student", selection: $selectedStudent, content: {
                ForEach(0 ..< students.count){
                    Text(self.students[$0])
                }
            })
            
            // .navigationBarTitle("SwiftUI")
            .navigationBarTitle("SwiftUI", displayMode: .inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
