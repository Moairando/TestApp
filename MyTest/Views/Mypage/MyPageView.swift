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
            
            //System info
            Section("一般") {
                HStack (spacing: 16) {
                    Image(systemName: "gear")
                        .imageScale(.large)
                        .foregroundStyle(.gray)
                    
                    Text("バージョン")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
            }
            
            //Navigation
            Section("アカウント") {
                Button {
                    
                }label: {
                    HStack (spacing: 16) {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(.red)
                        
                        Text("プロフィール変更")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                        
                    }
                }
                
                Button {
                    
                }label: {
                    HStack (spacing: 16) {
                        Image(systemName: "arrow.left.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(.red)
                        
                        Text("ログアウト")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                        
                    }
                }
                
                Button {
                    
                }label: {
                    HStack (spacing: 16) {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(.red)
                        
                        Text("アカウント削除")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                        
                    }
                }
            }
            
        }
    }
}

#Preview {
    MyPageView()
}
