//
//  PostMediaView.swift
//  Tiktok Clone
//

import SwiftUI

struct PostMediaView: View {
    var body: some View {
        Image("post")
            .resizable()
            .scaledToFill()
            .frame(width: 0)
            .ignoresSafeArea()
    }
}

#Preview {
    PostMediaView()
}
