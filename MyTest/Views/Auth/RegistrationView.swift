//
//  RegistrationView.swift
//  MyTest
//
//

import SwiftUI

struct RegistrationView: View {
    
    //private let authViewModel = AuthViewModel()
    let authViewModel: AuthViewModel
    
    @State private var email = ""
    @State private var name = ""
    @State private var age = 18
    @State private var password = ""
    @State private var comfirmpassword = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            
            //Image
            BrandImage()
            
            //Form
            VStack(spacing: 24) {
                InputField(text: $email, label: "メールアドレス", placeholder: "入力してください")
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("お名前")
                        .foregroundStyle(Color(.darkGray))
                        .fontWeight(.semibold)
                        .font(.footnote)
                    TextField("入力してください", text: $name)
                    Divider()
                }
                
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("年齢")
                            .foregroundStyle(Color(.darkGray))
                            .fontWeight(.semibold)
                            .font(.footnote)
                        
                        Spacer()
                        
                        Picker(selection: $age) {
                            ForEach(18..<100) {num in
                                Text("\(num)")
                                    .tag(num)
                            }
                        } label: {
                            Text("年齢")
                        }
                        .tint(.black)
                        
                    }
                    
                    Divider()
                }
                
                InputField(text: $password, label: "パスワード", placeholder: "半角英数字6文字以上", isSecureField: true)
                
                InputField(text: $comfirmpassword, label: "パスワード(確認用)", placeholder: "もう一度入力してください", isSecureField: true)
            }
            
            
            
            //Button
            BasicButton(label: "登録", icon: "arrow.right") {
                Task {
                    await authViewModel.createAccount(
                        email: email,
                        password: password,
                        name: name,
                        age: age
                    )
                }
            }
            .padding(.top, 24)
            
            Spacer()
            
            //Navigation
            Button {
                dismiss()
                
            } label: {
                HStack {
                    Text("すでにアカウントをお持ちの方")
                    Text("ログイン")
                        .fontWeight(.bold)
                }
                .foregroundStyle(Color(.darkGray))
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    RegistrationView(authViewModel: AuthViewModel())
}
