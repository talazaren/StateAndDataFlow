//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Tatiana Lazarenko on 4/23/24.
//

import Foundation
import SwiftUI

final class StorageManager: ObservableObject {
    static let shared = StorageManager()
    
    @AppStorage("username") private var username: String = ""
    @AppStorage("isRegistered") private var isRegistered: Bool = false
    
    var getName: String {
        username
    }
    
    var getStatus: Bool {
        isRegistered
    }
    
    private init() {}
    
    func saveData(loginViewVM: LoginViewViewModel) {
        username = loginViewVM.name
        isRegistered = loginViewVM.isLoggedIn
    }
    
    func deleteData() {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "isRegistered")
    }
}
