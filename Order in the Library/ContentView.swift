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
                ZStack {
                    Image("library")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .blur(radius: 10)
                        .overlay(Color.black.opacity(0.3))
                    
                    VStack {
                        Spacer()
                        
                        Text("Order in")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(.white)
                        Text("the Library")
                            .font(.system(size: 48, weight: .bold))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        NavigationLink(destination: ContentView()) { // Replace ContentView() with GameView() when created
                            Text("Play")
                                .font(.system(size: 17, weight: .bold))
                                .frame(width: 100)
                                .padding()
                                .background(Color.black.opacity(0.3))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 10)
                        
                        NavigationLink(destination: ContentView()) { // Replace InstructionsView() with GameView() when created
                            Text("How to Play")
                                .font(.system(size: 17, weight: .bold))
                                .frame(width: 100)
                                .padding()
                                .background(Color.black.opacity(0.5))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 10)
                        
                        NavigationLink(destination: ContentView()) { // Replace AboutView() with GameView() when created
                            Text("About")
                                .font(.system(size: 17, weight: .bold))
                                .frame(width: 100)
                                .padding()
                                .background(Color.black.opacity(0.5))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 10)
                        
                        
                        Spacer()
                    }
                    .padding(.vertical, 50)
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                    NavigationLink("Game Instructions", destination: InstructionsView())
                }
            }
            .navigationBarHidden(true)
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
