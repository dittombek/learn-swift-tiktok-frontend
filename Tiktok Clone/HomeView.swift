//
//  HomeView.swift
//  Tiktok Clone
//
//  Created by Ryandra Anditto on 30/04/26.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: String = "For You"
    
    struct PostAction: Identifiable {
        let id = UUID()
        let icon: String
        let label: String
        var isLiked: Bool? = nil
    }

    @State private var actions: [PostAction] = [
        PostAction(icon: "heart.fill", label: "1.2k", isLiked: false),
        PostAction(icon: "bubble.fill", label: "1.2k"),
        PostAction(icon: "bookmark.fill", label: "1.2k"),
        PostAction(icon: "arrowshape.turn.up.forward.fill", label: "Share"),
    ]
    
    func actionButton(action: PostAction) -> some View {
        VStack {
            Button {
                if let index = actions.firstIndex(where: { $0.id == action.id }),
                   actions[index].isLiked != nil {
                    actions[index].isLiked?.toggle()
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
    
    var body: some View {
        GeometryReader { geometry in
        ZStack {
            // video player
            Image("post")
                .resizable()
                .scaledToFill()
                .frame(width: 0)
                .ignoresSafeArea()
            
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
                
                // User action area
                HStack {
                    // Info post
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        Text("Casey")
                            .fontWeight(.semibold)
                        
                        Spacer().frame(height: 16)
                        
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book")
                            .lineLimit(2)
                            .truncationMode(.tail)
                        
                        Spacer().frame(height: 16)
                        
                        HStack {
                            Image(systemName: "music.note")
                            Text("Akon - Lonely")
                        }
                        .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    
                    Spacer().frame(width: 56)
                    
                    // Response
                    VStack {
                        Spacer()
                        
                        ZStack(alignment: .bottom) {
                            Image("photo-profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 56, height: 56)
                                .clipShape(Circle())
                            
                            Button{
                                
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
                .padding(.horizontal, 8)
                .padding(.bottom, geometry.safeAreaInsets.bottom + 32)
            }
        }
        }
    }
}

#Preview {
    HomeView()
}
