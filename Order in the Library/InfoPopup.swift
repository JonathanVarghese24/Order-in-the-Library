//
//  InfoPopup.swift
//  Order in the Library
//
//  Created by JV on 3/6/25.
//

import SwiftUI

struct InfoPopup: View {
    let title: String
    let message: String
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isPresented = false
                }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                ScrollView {
                    Text(message)
                        .font(.body)
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.bottom, 20)
                }

                Button(action: { isPresented = false }) {
                    Text("Close")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding()
            .frame(width: 350, height: 450) // Set the popup size here
            .background(Color.black.opacity(0.9))
            .cornerRadius(20)
            .shadow(radius: 20)
            .padding(30)
        }
    }
}
