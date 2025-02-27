//
//  ContentView.swift
//  Order in the Library
//
//  Created by JV on 2/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                    NavigationLink("Game Instructions", destination: InstructionsView())
                }
                .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct InstructionsView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Game Instructions")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Text(" 1) sort books by there decimal number from least to greatest, if the book is fiction sort the book by the authors last name")
                Text(" 2) once you have sorted the books click the check books button to see if they are correct")
                Text(" 3) all books will be randomly selected so levels will not be the exact same ")
                Text(" 4) if needed there will be a check alphabet button to see the alphabet")
                Spacer()
            }
        }
    }
}
