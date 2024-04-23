//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    @Published var name = StorageManager.shared.loadData().0
    @Published var isLoggedIn = StorageManager.shared.loadData().1
}
