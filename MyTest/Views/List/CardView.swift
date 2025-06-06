//
//  CardView.swift
//  MyTest
//
//  Created by 田端悠之介 on 2025/03/19.
//

import SwiftUI

struct CardView: View {
    
    @State private var offset: CGSize = .zero
    let user: User
    let adjustIndex: (Bool) -> Void
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            //background
            Color.black
            
            //image
            imageLayer
            
            //gradient
            LinearGradient(colors: [.clear, .black], startPoint: .center, endPoint: .bottom)
            
            //imformation
            imformationLayer
            
            //LIKE and NOPE
            LikeandNope
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .offset(offset)
        .gesture(gesture)
        .scaleEffect(scale)
        .rotationEffect(.degrees(angle))
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("ACTIONFROMBUTTON"), object: nil)) { data in
            receiveHandler(data: data)
        }
    }
}

#Preview {
    ListView()
}

//MARK: -UI
extension CardView {
    
    private var imageLayer: some View {
        Image(user.photoUrl ?? "SwiftUI Firebase Course Avatar")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100)
    }
    
    private var imformationLayer: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom){
                Text(user.name)
                    .font(.largeTitle.bold())
                
                Text("\(user.age)")
                    .font(.title2)
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(.white, .blue)
                    .font(.title2)
                
            }
            
            if let message = user.message {
                Text(message)
            }
            
            
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    private var LikeandNope: some View {
        
        HStack {
            //Like
            Text("LIKE")
                .LikeNopeText(isLike: true)
                .opacity(opacity)
            
            Spacer()
            
            
            //Nope
            Text("NOPE")
                .LikeNopeText(isLike: false)
                .opacity(-opacity)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        
        
    }
    
}

//MARK: -Action
extension CardView {
    
    private var screenWidth: CGFloat {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return 0.0 }
        return window.coordinateSpace.bounds.width
    }
    
    
    private var scale: CGFloat {
        return max(1.0 - (abs(offset.width / screenWidth)), 0.75)
        
    }
    
    private var angle: Double {
        return (offset.width / screenWidth) * 10.0
    }
    
    private var opacity: Double {
        return (offset.width / screenWidth) * 5.0
    }
    
    
    private func removeCard(isLiked: Bool, height: CGFloat = 0.0) {
        withAnimation(.smooth) {
            offset = CGSize(width: isLiked ? screenWidth * 1.5 : -screenWidth * 1.5, height: height)
        }
        adjustIndex(false)
    }
    
    private func resetCard() {
        withAnimation(.spring()) {
            offset = .zero
        }
        adjustIndex(true)
    }
    
    
    private var gesture: some Gesture {
        DragGesture()
            .onChanged { value in
                let width = value.translation.width
                let height = value.translation.height
                
                let limitedHeight = height > 0 ? min(height, 100) : max(height, -100)
                
                offset = CGSize(width: width, height: limitedHeight)
            }
        
            .onEnded { value in
                
                let width = value.translation.width
                let height = value.translation.height
                
                removeCard(isLiked: width > 0, height: height)
                
                if abs(width) > (screenWidth / 4) {
                    
                } else {
                    resetCard()
                    
                }
                
            }
    }
    
    private func receiveHandler(data: NotificationCenter.Publisher.Output) {
        guard
            let info = data.userInfo,
            let id = info["id"] as? String,
            let action = info["action"] as? Action else { return }
        
        if id == user.id {
            switch action {
                
            case .nope:
                removeCard(isLiked: false)
            case .redo:
                resetCard()
            case .like:
                removeCard(isLiked: true)
            }
        }
    }
}
