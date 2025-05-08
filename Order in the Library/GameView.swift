//
//  GameView.swift
//  Order in the Library
//
//  Created by Chase Hashiguchi on 3/3/25.
//

import SwiftUI

struct GameView: View {
    let difficulty: Int

    @State private var selectedBooks: [Books] = []
    @State private var selectedIndex: Int? = nil    //Checks which book is selected. Starts as null so that no books start as selected
    @State private var resultMessage = ""
    @State private var isTextVisible = false
    @Environment(\.verticalSizeClass) private var verticalSizeClass    //Helps to check if the device is in portrait or landscape

    private var numberOfBooks: Int {    // Controls how many books are shown, cases correspond to difficulty
        switch difficulty {
        case 2: return 5
        case 3: return 8
        default: return 3
        }
    }
    private var isPortrait: Bool {     // Returns true if the app is in portrait mode, false if it is in landscape
        verticalSizeClass == .regular
    }

    var body: some View {
        ZStack {
            Image("library")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 5)
                .overlay(Color.black.opacity(0.4))

            VStack(spacing: 16) {
                if isPortrait {
                    Text("Play")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)

                    Button(action: {
                        isTextVisible.toggle()
                    }) {
                        Text(isTextVisible ? "Hide Alphabet" : "Show Alphabet")
                            .padding()
                            .frame(maxWidth: 200)
                            .background(isTextVisible ? Color.red : Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                            .font(.headline)
                    }
                    .padding()

                    Text("Difficulty: \(difficulty)")
                        .foregroundColor(.white)
                        .font(.headline)

                    if isTextVisible {
                        Text("A B C D E F G H I J K L M N O P Q R S T U V W X Y Z")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .heavy))
                            .transition(.slide)
                    }
                }

                Text(resultMessage)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top)

                HStack(spacing: 20) {
                    ForEach(selectedBooks.indices, id: \.self) { index in
                        Button(action: { bookTapped(at: index) }) {
                            Image(selectedBooks[index].imageName)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(8)
                                .shadow(radius: 4)
                                .overlay(
                                    // Highlight the selected book
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(
                                            selectedIndex == index ? Color.yellow : Color.clear,
                                            lineWidth: 3
                                        )
                                )
                        }
                        .frame(height: 120)
                    }
                }

                Spacer()

                Button(action: checkOrder) {
                    Text("Check Order")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 200)
                        .background(Color.blue)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
                .padding(.bottom)
            }
        }
        .onAppear { //when GameView appears, picks random books from the array of books
            selectedBooks = Array(sampleBooks.shuffled().prefix(numberOfBooks))
            shuffleBooks()
        }
    }

    private func bookTapped(at index: Int) { //function that helps swap books
        if let first = selectedIndex {
            withAnimation(.easeInOut) {
                selectedBooks.swapAt(first, index) //swaps positions of two books tapped
            }
            selectedIndex = nil // unselects book by turning the @State variable null again
            resultMessage = ""
        } else {
            // Otherwise, store this book's index as the first selection
            selectedIndex = index
        }
    }

    private func shuffleBooks() {
        var shuffled = selectedBooks
        repeat {
            shuffled.shuffle()
        } while shuffled == selectedBooks
        selectedBooks = shuffled
    }

    private func checkOrder() {
        let isCorrect = zip(selectedBooks, selectedBooks.sorted {
            (Double($0.deweyDecimal) ?? 0) < (Double($1.deweyDecimal) ?? 0) // Convert deweyDecimal from String to Double to compare numerical values
        }).allSatisfy { $0.imageName == $1.imageName }

        resultMessage = isCorrect
            ? "Good Job! You Sorted the Books Correctly"
            : "Close! Look at the Dewey Decimal Numbers and try again."
    }
}

#Preview {
    GameView(difficulty: 1)
}
