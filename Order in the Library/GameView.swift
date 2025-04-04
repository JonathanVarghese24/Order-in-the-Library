//
//  GameView.swift
//  Order in the Library
//
//  Created by Chase Hashiguchi on 3/3/25.
//

import SwiftUI

struct GameView: View {
    @State private var isTextvisible: Bool = false
    @State private var imageNames: [String] = ["image1", "image2", "image3"]
    @State private var draggingItem: String?
    @State private var resultMessage: String = ""
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
                    Text("A B C D E F G H I J K L M N O P Q R S T U V W X Y Z")
                        .foregroundColor(.white)
                        .font(.title)
                        .transition(.slide)
                }
                Text(resultMessage)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
            let columns = Array(repeating: GridItem(spacing: 10), count: 3)
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(imageNames, id: \.self) { imageName in
                    GeometryReader { geometry in
                        let size = geometry.size
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: size.width, height: size.height)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .draggable(imageName) {
                                Image(imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: size.width, height: size.height)
                                    .onAppear {
                                        draggingItem = imageName
                                    }
                            }
                            .dropDestination(for: String.self) { items, location in
                                return false
                            } isTargeted: { status in
                                if let draggingItem, status, draggingItem != imageName {
                                    if let sourceIndex = imageNames.firstIndex(of: draggingItem),
                                       let destinationIndex = imageNames.firstIndex(of: imageName) {
                                        withAnimation(.bouncy) {
                                            let sourceItem = imageNames.remove(at: sourceIndex)
                                            imageNames.insert(sourceItem, at: destinationIndex)
                                        }
                                    }
                                }
                            }
                    }
                }
                .frame(height: 100)
            }
            Button(action: checkOrder) {
                Text("Check Order")
                    .padding()
                    .frame(maxWidth: 200)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .font(.headline)
            }
            .frame(maxHeight: .infinity, alignment: .bottom) // Moves button to bottom
               .padding()
        }
        .onAppear {
            shuffleImages()
        }
    }
    private func shuffleImages() {
        var shuffledImages = imageNames
        repeat {
            shuffledImages.shuffle()
        } while shuffledImages == ["image1", "image2", "image3"]
        imageNames = shuffledImages
    }
    
    private func checkOrder() {
        if imageNames == ["image1", "image2", "image3"] {
            resultMessage = "you win"
        } else {
            resultMessage = "try again"
        }
    }
}

#Preview {
    GameView()
}
