//
//  CommentModalView.swift
//  Tiktok Clone
//

import SwiftUI

struct CommentModalView: View {
    @ObservedObject var viewModel: CommentViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 40, height: 5)
                
                Text("3 comments")
                    .fontWeight(.semibold)
                
                if viewModel.comments.isEmpty {
                    Text("No Comment")
                        .foregroundStyle(.gray)
                } else {
                    ScrollView {
                        rowComment()
                    }
                    .padding()
                }
                
                HStack {
                    Image("photo-profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipShape(.circle)
                    
                    HStack(alignment: .bottom, spacing: 8) {
                        TextField("Add a comment...", text: $viewModel.newCommentText, axis: .vertical)
                            .lineLimit(1...2)
                        
                        Button(action: viewModel.submitComment) {
                            Image(systemName: "paperplane.fill")
                                .foregroundStyle(viewModel.newCommentText.trimmingCharacters(in: .whitespaces).isEmpty ? .gray : .pink)
                        }
                        .disabled(viewModel.newCommentText.trimmingCharacters(in: .whitespaces).isEmpty)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                
            }
            .padding(.top, 12)
            .frame(maxWidth: .infinity)
            .frame(height: 400)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .ignoresSafeArea()
        .onAppear {
            viewModel.loadComments(postId: "1")
        }
    }
    
    func rowComment() -> some View {
        
        VStack(alignment: .leading, spacing: 12) {
            ForEach(viewModel.comments) { comment in
                HStack(alignment: .top, spacing: 0) {
                    Image("photo-profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipShape(.circle)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(comment.username)
                            .fontWeight(.semibold)
                            .font(.subheadline)
                        
                        Text(comment.text)
                            .font(.body)
                        
                        HStack(alignment: .center) {
                            Text("2026-01-01")
                                .font(.subheadline)
                                .foregroundStyle(.gray)

                            Spacer().frame(width: 16)

                            Button {
                                // action
                            } label: {
                                Text("Reply")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.gray)
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 4) {
                                Button(action: { viewModel.toggleLike(for: comment) }) {
                                    Image(systemName: viewModel.isLiked(comment) ? "heart.fill" : "heart")
                                        .foregroundStyle(viewModel.isLiked(comment) ? .pink : .primary)
                                }
                                Text("\(comment.likeCount + (viewModel.isLiked(comment) ? 1 : 0))")
                                    .foregroundStyle(.gray)
                                    .lineLimit(1)
                                
                                Spacer().frame(width: 8)
                                
                                Image(systemName: "hand.thumbsdown")
                            }
                            
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    CommentModalView(viewModel: CommentViewModel(
        getCommentsUseCase: GetCommentsUseCase(
            repository: CommentRepository()
        )
    ))
}
