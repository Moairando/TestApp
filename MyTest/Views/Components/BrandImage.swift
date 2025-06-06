//
//  BrandImage.swift
//  MyTest
//
//  Created by 田端悠之介 on 2025/06/04.
//

import SwiftUI

struct BrandImage: View {
    var body: some View {
        Image(systemName: "flame.circle.fill")
            .resizable()
            .scaledToFill()
            .foregroundStyle(.red)
            .frame(width: 120, height: 120)
            .padding(.vertical, 32)
    }
}

#Preview {
    BrandImage()
}
