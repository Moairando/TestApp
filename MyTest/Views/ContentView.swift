//
//  ContentView.swift
//  MyTest
//
//

import SwiftUI

struct ContentView: View {
    
    let authViewModel = AuthViewModel()
    
    var body: some View {
        Group {
            if authViewModel.userSession != nil {
                ListView()
                
            } else {
                LoginView()
                
            }
        }
    }
}

#Preview {
    ContentView()
}
