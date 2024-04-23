//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $loginViewVM.name)
                    .multilineTextAlignment(.center)
                Text(loginViewVM.name.count.formatted())
                    .foregroundStyle(lessThanThree() ? .red : .green)
            }
            .padding(.bottom, 10)
            
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")   
            }
            .disabled(lessThanThree())
            
        }
        .padding()
    }
    
    private func login() {
        if !loginViewVM.name.isEmpty {
            loginViewVM.isLoggedIn.toggle()
            storageManager.saveData(loginViewVM: loginViewVM)
        }
    }
    
    private func lessThanThree() -> Bool {
        let result = loginViewVM.name.count < 3
        return result
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
