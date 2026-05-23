//
//  HomeView.swift
//  Tiktok Clone
//
//  Created on 30/04/26.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: String = "For You"
    @EnvironmentObject var appState: AppState

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                PostMediaView()

                VStack {
                    // Navigation bar
                    HStack {
                        Image(systemName: "livephoto")
                            .font(.system(size: 28))

                        Spacer()

                        HStack(spacing: 24) {
                            ForEach(["Following", "For You"], id: \.self) { tab in
                                VStack(spacing: 4) {
                                    Text(tab)
                                        .fontWeight(selectedTab == tab ? .semibold : .regular)

                                    Rectangle()
                                        .frame(width: 24, height: 2)
                                        .opacity(selectedTab == tab ? 1 : 0)
                                }
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        selectedTab = tab
                                    }
                                }
                            }
                        }

                        Spacer()

                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 28))
                    }
                    .padding()
                    .foregroundColor(.white)

                    Spacer()

                    HStack {
                        PostDescriptionView(
                            username: "Casey",
                            caption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                            musicTitle: "Akon - Lonely"
                        )

                        Spacer().frame(width: 56)

                        PostActionsView()
                    }
                    .padding(.horizontal, 8)
                    .padding(.bottom, geometry.safeAreaInsets.bottom + 32)
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AppState())
}
