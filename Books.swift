//
//  Books.swift
//  Order in the Library
//
//  Created by Chase Hashiguchi on 4/7/25.
//

import Foundation

struct Books: Identifiable, Equatable {
    let id = UUID()
    let imageName: String
    let authorLastName: String
    let deweyDecimal: String
}
