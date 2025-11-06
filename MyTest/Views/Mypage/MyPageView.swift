//
//  MyPageView.swift
//  MyTest
//
//  Created by 田端悠之介 on 2025/09/20.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        List {
            
            //User info
            userinfo
            
            //System info
            Section("一般") {
                MyPageRow(iconName: "gear", label: "バージョン", tintColor: .gray, value: "1.0.0")
            }
            
            //Navigation
            Section("アカウント") {
                Button {
                    
                }label: {
                    MyPageRow(iconName: "square.and.pencil.circle.fill", label: "プロフィール変更", tintColor: .red)
                    
                }
                
                Button {
                    
                }label: {
                    
                    MyPageRow(iconName: "arrow.left.circle.fill", label: "ログアウト", tintColor: .red)
                }
                
                Button {
                    
                }label: {
                    MyPageRow(iconName: "xmark.circle.fill", label: "アカウント削除", tintColor: .red)
                    
                }
            }
            
        }
    }
}

#Preview {
    MyPageView()
}


extension MyPageView {
    private var userinfo: some View {
        Section {
            HStack(spacing: 16) {
                Image("SwiftUI Firebase Course Avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("ブルー")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    Text("blue@example.com")
                        .font(.footnote)
                        .tint(.gray)
                    
                }
            }
        }
    }
}
