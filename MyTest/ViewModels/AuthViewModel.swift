//
//  AuthViewModel.swift
//  MyTest
//
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
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
            self.userSession = result.user
            print("self.userSession: \(self.userSession?.email)")
            
        }catch {
            print("ログイン失敗: \(error.localizedDescription)")
            
        }
        
    }
    
    
    //MARK: Logout
    func logput() {
        do {
            try Auth.auth().signOut()
            print("ログアウト成功")
            self.userSession = nil
            
        }catch {
            print("ログアウト失敗: \(error.localizedDescription)")
        }
    }
    
    
    //MARK: Create Account
    
    func createAccount(email: String, password: String) async {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("ユーザー登録成功: \(result.user.email)")
            self.userSession = result.user
            
        }catch {
            print("ユーザー登録失敗: \(error.localizedDescription)")
        }
        
        
        
        print("アカウント確認画面から呼び出されました")
    }
    
    
    //MARK: Delete Account
    
}

