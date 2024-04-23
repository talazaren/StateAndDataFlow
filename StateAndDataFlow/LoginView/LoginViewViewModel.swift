//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    private let storageManager = StorageManager.shared
    
    @Published var name = ""
    @Published var isLoggedIn = false
    
    init() {
        name = storageManager.getName
        isLoggedIn = storageManager.getStatus
    }
}
