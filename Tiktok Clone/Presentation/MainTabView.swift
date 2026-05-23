//
//  MainTabView.swift
//  Tiktok Clone
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    @EnvironmentObject var appState: AppState

    private let commentViewModel = CommentViewModel(
        getCommentsUseCase: GetCommentsUseCase(
            repository: CommentRepository()
        )
    )

    var body: some View {
        ZStack(alignment: .bottom) {
            // Content
            Group {
                switch selectedTab {
                case 0: HomeView()
                case 1: Text("Friends").padding(.bottom, 80)
                case 3: Text("Inbox").padding(.bottom, 80)
                case 4: Text("Profile").padding(.bottom, 80)
                default: HomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Bottom tab bar
            HStack(spacing: 0) {
                tabBarItem(icon: "house.fill", label: "Home", index: 0)
                tabBarItem(icon: "person.2.fill", label: "Friends", index: 1)

                // Center create button
                Button {
                    // create action
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.red)
                            .frame(width: 38, height: 28)
                            .offset(x: -4)

                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(red: 0.12, green: 0.87, blue: 0.87))
                            .frame(width: 38, height: 28)
                            .offset(x: 4)

                        RoundedRectangle(cornerRadius: 8)
                            .fill(.white)
                            .frame(width: 38, height: 28)

                        Image(systemName: "plus")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.black)
                    }
                }
                .frame(maxWidth: .infinity)

                tabBarItem(icon: "message.fill", label: "Inbox", index: 3)
                tabBarItem(icon: "person.fill", label: "Profile", index: 4)
            }
            .padding(.top, 12)
            .background(.black)
        }
        // Background overlay — fade
        .overlay {
            if appState.showCommentModal {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            appState.showCommentModal = false
                        }
                    }
                    .transition(.opacity)
            }
        }
        // Modal sheet — slide dari bawah
        .overlay(alignment: .bottom) {
            if appState.showCommentModal {
                CommentModalView(viewModel: commentViewModel)
                    .transition(.move(edge: .bottom))
            }
        }
        .animation(.easeInOut(duration: 0.3), value: appState.showCommentModal)
    }

    func tabBarItem(icon: String, label: String, index: Int) -> some View {
        Button {
            selectedTab = index
        } label: {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 22))
                Text(label)
                    .font(.system(size: 10))
            }
            .foregroundStyle(selectedTab == index ? .white : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    MainTabView()
        .environmentObject(AppState())
}
