//
//  CertificateView.swift
//  Order in the Library
//
//  Created by Chase Hashiguchi on 5/8/25.
//

import SwiftUI

struct CertificateView: View {
    @State private var fullName: String = ""
    @State private var certificateID: String = UUID().uuidString //stores a unique String identifier
    @State private var showCertificate = false
    var body: some View {
        ZStack {
            Image("library")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 5)
                .overlay(Color.black.opacity(0.5))
            if showCertificate {
                CertificateDisplay(fullName: fullName, certificateID: certificateID)
            } else {
                VStack(spacing: 10) {
                    Text("Generate Your Certificate")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    TextField("Enter Your Full Name",text: $fullName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 200)
                        .padding()
                    Button("Generate Certificate") {
                        certificateID = UUID().uuidString
                        showCertificate = true
                    }
                    .disabled(fullName.isEmpty)
                    .padding()
                    .frame(maxWidth: 200)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .font(.headline)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    CertificateView()
}

struct CertificateDisplay: View {
    let fullName: String
    let certificateID: String
    var body: some View {
        VStack(spacing: 10) {
            Text("Certificate of Completion")
                .font(.title).bold()
                .foregroundColor(.white)
            Text("Awarded to: ")
                .bold()
                .foregroundColor(.white)
            Text(fullName)
                .font(.title2).bold()
                .foregroundColor(.white)
            Text("This certificate allows you to volunteer to sort")
                .bold()
                .foregroundColor(.white)
            Text("books in a library")
                .bold()
                .foregroundColor(.white)
            Text("Certificate ID: \(certificateID)")
                .bold()
                .foregroundColor(.white)
        }
    }
}
