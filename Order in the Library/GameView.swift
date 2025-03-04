//
//  GameView.swift
//  Order in the Library
//
//  Created by Chase Hashiguchi on 3/3/25.
//

import SwiftUI

struct GameView: View {
    @State private var isTextvisible: Bool = false
    var body: some View {
        ZStack {
            Image("library")
                .resizable()
                //.aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 5)
                .overlay(Color.black.opacity(0.2))
            VStack(spacing: 10) {
                Text("Play")
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
                Button(action: {
                    isTextvisible.toggle()
                }) {
                    Text(isTextvisible ? "Hide Alphabet" : "Show Alphabet")
                        .padding()
                        .frame(maxWidth: 200)
                        .background(isTextvisible ? Color.red : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .font(.headline)
                }
                .padding()
                if isTextvisible {
                    Text("A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z")
                        .foregroundColor(.white)
                        .font(.title)
                        .transition(.slide)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    GameView()
}
