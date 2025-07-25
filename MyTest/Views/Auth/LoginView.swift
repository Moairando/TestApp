//
//  LoginView.swift
//  MyTest
//
//

import SwiftUI

struct LoginView: View {
    
    let authViewModel: AuthViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                
                //Image
                BrandImage()
                
                //Form
                VStack(spacing: 24) {
                    InputField(text: $email, label: "メールアドレス", placeholder: "入力してください")
                    
                    InputField(text: $password, label: "パスワード", placeholder: "半角英数字6文字以上", isSecureField: true)
                    
                    Divider()
                }
                
                //Button
                BasicButton(label: "ログイン", icon: "arrow.right") {
                    Task {
                        await authViewModel.login(email: email, password: password)
                    }
                }
                .padding(.top, 24)
                
                Spacer()
                
                //Navigation
                NavigationLink {
                    RegistrationView(authViewModel: authViewModel)
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Text("まだアカウントをお持ちでない方")
                        Text("会員登録")
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(Color(.darkGray))
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    LoginView(authViewModel: AuthViewModel())
}
