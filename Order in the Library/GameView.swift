//
//  GameView.swift
//  Order in the Library
//
//  Created by Chase Hashiguchi on 3/3/25.
//

import SwiftUI

struct GameView: View {
    @State private var isTextvisible = false
    @State private var imageNames: [String] = []
    @State private var draggingItem: String?
    @State private var resultMessage = ""
    @State private var selectedDifficulty: String = "Easy"
    var numberOfBooks: Int {
        difficultyLevels[selectedDifficulty] ?? 5
    }
    let difficultyLevels = ["Easy": 5, "Medium": 12, "Hard": 25]

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
                Picker("Select Difficulty", selection: $selectedDifficulty) {
                    ForEach(difficultyLevels.keys.sorted(), id: \.self) { level in
                        Text(level).tag(level)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .onChange(of: selectedDifficulty) {
                    imageNames = sampleBooks.prefix(numberOfBooks).map(\.imageName)
                    shuffleImages()
                }
                if isTextvisible {
                    Text("A B C D E F G H I J K L M N O P Q R S T U V W X Y Z")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .heavy))
                        .transition(.slide)
                }
                Text(resultMessage)
                    .font(.system(size: 14, weight: .heavy))
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
            ScrollView {
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
                                .dropDestination(for: String.self) { _, _ in
                                    false
                                } isTargeted: { status in
                                    if let draggingItem, status, draggingItem != imageName {
                                        if let from = imageNames.firstIndex(of: draggingItem),
                                           let to = imageNames.firstIndex(of: imageName) {
                                            withAnimation(.bouncy) {
                                                let moved = imageNames.remove(at: from)
                                                imageNames.insert(moved, at: to)
                                            }
                                        }
                                    }
                                }
                        }
                        .frame(height: 100)
                    }
                }
            }
            .frame(maxHeight: 200)

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
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding()
        }
        .onAppear {
            imageNames = sampleBooks.prefix(numberOfBooks).map(\.imageName)
            shuffleImages()
        }
    }

    private func shuffleImages() {
        var shuffled = imageNames
        repeat {
            shuffled.shuffle()
        } while shuffled == imageNames
        imageNames = shuffled
    }

    private func checkOrder() {
        let correctOrder = sampleBooks.prefix(numberOfBooks).map(\.imageName)
        if imageNames == correctOrder {
            resultMessage = "You win!"
        } else {
            resultMessage = "Try again."
        }
    }
}

#Preview {
    GameView()
}
