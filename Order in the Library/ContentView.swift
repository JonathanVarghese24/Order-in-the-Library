//
//  ContentView.swift
//  Order in the Library
//
//  Created by JV on 2/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showInstructionsPopup = false
    @State private var showAboutPopup = false

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
                        
                        NavigationLink(destination: GameView()) {
                            Text("Play")
                                .font(.system(size: 17, weight: .bold))
                                .frame(width: 100)
                                .padding()
                                .background(Color.black.opacity(0.3))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 10)

                        // Show Instructions Popup
                        Button(action: {
                            showInstructionsPopup = true
                        }) {
                            Text("How to Play")
                                .font(.system(size: 17, weight: .bold))
                                .frame(width: 100)
                                .padding()
                                .background(Color.black.opacity(0.5))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 10)

                        // Show About Popup
                        Button(action: {
                            showAboutPopup = true
                        }) {
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

                    // Show the popups
                    
                    if showInstructionsPopup {
                        InfoPopup(
                            title: "How to Play",
                            message: """
                            1. Sort books by their decimal number from least to greatest. If the book is fiction, sort by the author's last name.
                            2. Click the 'Check Books' button to verify your sorting.
                            3. All books are randomly selected, so each level is different.
                            4. Use the 'Check Alphabet' button if you need help with letter order.
                            """,
                            isPresented: $showInstructionsPopup
                        )
                        .lineSpacing(10) // Add space between lines
                    }

                    

                    if showAboutPopup {
                        InfoPopup(
                            title: "About the App",
                            message: """
                            This app helps train library volunteers to shelve books properly. It simulates real-life scenarios using the Dewey Decimal System and author name sorting.
                            """,
                            isPresented: $showAboutPopup
                        )
                    }
                }
                .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    ContentView()
}
