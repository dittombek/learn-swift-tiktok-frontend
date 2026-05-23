//
//  PostActionsView.swift
//  Tiktok Clone
//

import SwiftUI

struct PostActionsView: View {
    struct PostAction: Identifiable {
        let id = UUID()
        let icon: String
        let label: String
        var isLiked: Bool? = nil
    }

    @EnvironmentObject var appState: AppState
    @State private var actions: [PostAction] = [
        PostAction(icon: "heart.fill", label: "1.2k", isLiked: false),
        PostAction(icon: "bubble.fill", label: "1.2k"),
        PostAction(icon: "bookmark.fill", label: "1.2k"),
        PostAction(icon: "arrowshape.turn.up.forward.fill", label: "Share"),
    ]

    var body: some View {
        VStack {
            Spacer()

            ZStack(alignment: .bottom) {
                Image("photo-profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())

                Button {
                } label: {
                    Circle()
                        .fill(.red)
                        .frame(width: 24, height: 24)
                        .overlay {
                            Image(systemName: "plus")
                        }
                        .foregroundStyle(Color.white)
                        .offset(y: 10)
                }
            }

            Spacer().frame(height: 32)

            ForEach(actions) { action in
                actionButton(action: action)
            }

            Image("photo-profile")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
        }
    }

    func actionButton(action: PostAction) -> some View {
        VStack {
            Button {
                if let index = actions.firstIndex(where: { $0.id == action.id }) {
                    if actions[index].isLiked != nil {
                        actions[index].isLiked?.toggle()
                    } else if action.icon == "bubble.fill" {
                        appState.showCommentModal = true
                    }
                }
            } label: {
                Image(systemName: action.icon)
                    .font(.system(size: 32))
                    .foregroundStyle(action.isLiked == true ? .red : .white)
            }

            Text(action.label)
        }
        .foregroundStyle(.white)
        .padding(.bottom, 18)
    }
}

#Preview {
    ZStack {
        Color.black
        HStack {
            Spacer()
            PostActionsView()
                .padding()
        }
    }
    .environmentObject(AppState())
}
