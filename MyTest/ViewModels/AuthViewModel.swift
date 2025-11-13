//
//  AuthViewModel.swift
//  MyTest
//
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    //MARK: Initalizer
    init () {
        self.userSession = Auth.auth().currentUser
        print("ログインユーザー: \(self.userSession?.email)")
        
        Task {
            await self.fetchCurrentUser()
        }
        
    }
    
    //MARK: Login
    @MainActor
    func login(email: String, password: String) async {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            print("ログイン成功: \(result.user.email)")
            self.userSession = result.user
            
        }catch {
            print("ログイン失敗: \(error.localizedDescription)")
            
        }
        
    }
    
    
    //MARK: Logout
    func logout() {
        do {
            try Auth.auth().signOut()
            print("ログアウト成功")
            self.userSession = nil
            
        }catch {
            print("ログアウト失敗: \(error.localizedDescription)")
        }
    }
    
    
    //MARK: Create Account
    @MainActor
    func createAccount(email: String, password: String, name: String, age: Int) async {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("ユーザー登録成功: \(result.user.email)")
            self.userSession = result.user
            
            let newUser = User(id: result.user.uid, name: name, email: email, age: age)
            await uploadUserData(withUser: newUser)
            
        }catch {
            print("ユーザー登録失敗: \(error.localizedDescription)")
        }
        
        print("アカウント確認画面から呼び出されました")
    }
    
    
    //MARK: Delete Account
    
    
    //MARK: Upload User Data
    private func uploadUserData(withUser user: User) async {
        
        do {
            let UserData = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(UserData)
            print("データ保存成功")
            
        }catch {
            print("データ保存失敗: \(error.localizedDescription)")
        }
    }
    
    //Fetch Current User
    @MainActor
    private func fetchCurrentUser() async {
        
        guard let uid = self.userSession?.uid else { return }
        
        do {
            let snapShot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            self.currentUser = try snapShot.data(as: User.self)
            print("カレントユーザー取得成功: \(self.currentUser)")
            
        }catch {
            
            print("カレントユーザー取得失敗: \(error.localizedDescription)")
        }
        
    }
    
    
    // update user profile
    
    func updateUserProfile(withId id: String, name: String, age: Int, message: String) async {
        
        let data: [AnyHashable: Any] = [
            "name": name,
            "age": age,
            "message": message,
        ]
        
        do {
            try await Firestore.firestore().collection("users").document(id).updateData(data)
            print("プロフィール更新成功")
        } catch {
            print("プロフィール更新失敗: \(error.localizedDescription)")
        }
        
    }
    
}

