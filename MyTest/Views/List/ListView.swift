//
//  ListView.swift
//  MyTest
//
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject private var viewModel = ListViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            
            //Cards
            cards
            
            
            //Actions
            actions
            
        }
        .background(.black, in: RoundedRectangle(cornerRadius: 15))
        .padding(.horizontal, 6)
        NavigationStack {
            Group {
                if viewModel.users.count > 0 {
                    VStack(spacing: 0) {
                        
                        //Cards
                        cards
                        
                        
                        //Actions
                        actions
                        
                    }
                    .background(.black, in: RoundedRectangle(cornerRadius: 15))
                    .padding(.horizontal, 6)
                } else {
                    ProgressView()
                        .padding()
                        .tint(Color.white)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .scaleEffect(1.5)
                }
            }
            .navigationTitle("Fire Match")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    BrandImage(size: .small)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        MyPageView()
                    } label: {
                        Image("SwiftUI Firebase Course Avatar")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 32, height: 32)
                            .clipShape(.circle)
                    }
                }
            }
        }
        .tint(.primary)
>>>>>>> Stashed changes
    }
}

#Preview {
    ListView()
}

extension ListView {
    
    private var cards: some View {
        ZStack {
            ForEach(viewModel.users.reversed()) { user in
                CardView(user: user) { isRedo in
                    viewModel.adjustIndex(isRedo: isRedo)
                }
            }
        }
    }
    
    private var actions: some View {
        HStack(spacing: 68) {
            
            ForEach(Action.allCases, id: \.self) {type in
                type.createActionButton(viewModel: viewModel)
            }
        }
        .foregroundStyle(.white)
        .frame(height: 100)
    }
}

