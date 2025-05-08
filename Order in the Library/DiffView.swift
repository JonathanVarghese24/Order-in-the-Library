//
//  DiffView.swift
//  Order in the Library
//
//  Created by JV on 5/5/25.
//

import SwiftUI

struct DiffView: View {
    @Binding var level: Int

    init(level: Binding<Int>) {
        // 1) initialize the binding
        self._level = level

        // 2) configure nav‐bar to use white large titles
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.titleTextAttributes          = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance   = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Image("library")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .blur(radius: 10)
                    .overlay(Color.black.opacity(0.3))

                HStack(spacing: 32) {
                    Button {
                        level = (level == 1) ? 3 : (level - 1)
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 36, weight: .medium))
                            .frame(width: 80, height: 80)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(16)
                    }

                    Text("\(level)")
                        .font(.system(size: 36, weight: .semibold))
                        .frame(width: 80, height: 80)
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(16)

                    Button {
                        level = (level == 3) ? 1 : (level + 1)
                    } label: {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 36, weight: .medium))
                            .frame(width: 80, height: 80)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(16)
                    }
                }
            }
            .navigationTitle("Choose Your Difficulty!")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct DiffView_Previews: PreviewProvider {
    static var previews: some View {
        DiffView(level: .constant(1))
    }
}
