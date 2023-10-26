//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Burhanuddin Jinwala on 10/25/23.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "All fields are required"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please Enter valid email"
            return false
        }
        return true
    }
}
