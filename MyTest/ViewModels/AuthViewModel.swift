//
//  AuthViewModel.swift
//  MyTest
//
//

import Foundation
import FirebaseAuth

class AuthViewModel {
    
    //Login
    
    
    //Logout
    
    
    //Create Account
    
    func createAccount(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password)
        print("アカウント確認画面から呼び出されました")
    }
    
    
    //Delete Account
    
}

