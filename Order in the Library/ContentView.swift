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
                        
                        NavigationLink(destination: InstructionsView()) { // Replace InstructionsView() with GameView() when created
                            Text("How to Play")
                                .font(.system(size: 17, weight: .bold))
                                .frame(width: 100)
                                .padding()
                                .background(Color.black.opacity(0.5))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 10)
                        
                        NavigationLink(destination: AboutView()) { // Replace AboutView() with GameView() when created
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
                }
                .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct InstructionsView: View {
    var body: some View {
        ZStack {
            Image("library")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 10)
                .overlay(Color.black.opacity(0.3))
            VStack(spacing: 20 ) {
                Text("Game Instructions")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                Text("1) Sort books by their decimal number from least to greatest. If the book is fiction, sort by the author's last name.")
                    .foregroundColor(.white)
                Text("2) Once you have sorted the books, click the 'Check Books' button to see if they are correct.")
                    .foregroundColor(.white)
                Text("3) All books will be randomly selected, so levels will not be exactly the same.")
                    .foregroundColor(.white)
                Text("4) If needed, there will be a 'Check Alphabet' button to view the alphabet.")
                    .foregroundColor(.white)
                Spacer()
            }
        }
    }
}

struct AboutView: View {
    var body: some View {
        ZStack {
            Image("library")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 10)
                .overlay(Color.black.opacity(0.3))
            VStack(spacing: 20) {
                Text("About")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                Text("This app is meant to help train library volunteers so they can shelve books in proper order. It will assist them in sorting books using the Dewey Decimal Classification System and sorting by three letters of the author’s last name.")
                    .foregroundColor(.white)
                Spacer()
            }
        }
    }
}
