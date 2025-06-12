//
//  AuthViewModel.swift
//  MyTest
//
//

import Foundation
import FirebaseAuth

class AuthViewModel {
    
    var userSession: FirebaseAuth.User?
    
    //MARK: Initalizer
    init () {
        self.userSession = Auth.auth().currentUser
        print("ログインユーザー: \(self.userSession?.email)")
    }
    
    //MARK: Login
    func login(email: String, password: String) async {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            print("ログイン成功: \(result.user.email)")
            
        }catch {
            print("ログイン失敗: \(error.localizedDescription)")
            
        }
        
    }
    
    
    //MARK: Logout
    func logput() {
        do {
            try Auth.auth().signOut()
            print("ログアウト成功")
            
        }catch {
            print("ログアウト失敗: \(error.localizedDescription)")
        }
    }
    
    
    //MARK: Create Account
    
    func createAccount(email: String, password: String) async {
//        Auth.auth().createUser(withEmail: email, password: password)
//        Auth.auth().createUser(withEmail: email, password: password) { result, error in
//            print("Firebaseサーバーからの結果が通知されました")
//            
//            if let error = error {
//                print("ユーザー登録失敗: \(error.localizedDescription)")
//            }
//            
//            if let result = result {
//                print("ユーザー登録成功: \(result.user.email)")
//            }
//        }
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("ユーザー登録成功: \(result.user.email)")
            
        }catch {
            print("ユーザー登録失敗: \(error.localizedDescription)")
        }
        
        
        
        print("アカウント確認画面から呼び出されました")
    }
    
    
    //MARK: Delete Account
    
}

