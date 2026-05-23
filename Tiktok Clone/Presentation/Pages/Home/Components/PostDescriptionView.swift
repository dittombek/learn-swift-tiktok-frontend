//
//  PostDescriptionView.swift
//  Tiktok Clone
//

import SwiftUI

struct PostDescriptionView: View {
    let username: String
    let caption: String
    let musicTitle: String

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()

            Text(username)
                .fontWeight(.semibold)

            Spacer().frame(height: 16)

            Text(caption)
                .lineLimit(2)
                .truncationMode(.tail)

            Spacer().frame(height: 16)

            HStack {
                Image(systemName: "music.note")
                Text(musicTitle)
            }
            .fontWeight(.semibold)
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        Color.black
        PostDescriptionView(
            username: "Casey",
            caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            musicTitle: "Akon - Lonely"
        )
        .padding()
    }
}
