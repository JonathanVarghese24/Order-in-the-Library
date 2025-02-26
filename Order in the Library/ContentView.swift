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
                }
            }
            .navigationBarHidden(true)
        }
    }
}
