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
//        Auth.auth().createUser(withEmail: email, password: password)
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            print("Firebaseサーバーからの結果が通知されました")
            
            if let error = error {
                print("ユーザー登録失敗: \(error.localizedDescription)")
            }
            
            if let result = result {
                print("ユーザー登録成功: \(result.user.email)")
            }
        }
        print("アカウント確認画面から呼び出されました")
    }
    
    
    //Delete Account
    
}

