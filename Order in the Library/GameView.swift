//
//  GameView.swift
//  Order in the Library
//
//  Created by Chase Hashiguchi on 3/3/25.
//

import SwiftUI

struct GameView: View {
    @State private var isTextvisible: Bool = false
    @State private var imagePositions: [CGFloat] = [100, 200, 300] // Positions of images in the x-axis
    let imageNames = ["image1", "image2", "image3"] // place holder for book images
    let yPosition: CGFloat = 400 // Set a constant y-position for all images
    var body: some View {
        ZStack {
            Image("library")
                .resizable()
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
            ForEach(0..<imageNames.count, id: \.self) { index in
                Image(imageNames[index])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .position(x: imagePositions[index], y: yPosition)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                // Update position only on x-axis
                                imagePositions[index] = value.location.x
                            }
                    )
            }
        }
    }
}

#Preview {
    GameView()
}
