//
//  CommentViewModel.swift
//  Tiktok Clone
//

import Foundation
import Combine

class CommentViewModel: ObservableObject {
    @Published var comments: [Comment] = []
    @Published var newCommentText: String = ""
    @Published var likedCommentIds: Set<String> = []

    private let getCommentsUseCase: GetCommentsUseCase

    init(getCommentsUseCase: GetCommentsUseCase) {
        self.getCommentsUseCase = getCommentsUseCase
    }

    func loadComments(postId: String) {
        comments = getCommentsUseCase.execute(postId: postId)
    }

    func submitComment() {
        let text = newCommentText.trimmingCharacters(in: .whitespaces)
        guard !text.isEmpty else { return }
        newCommentText = ""
    }

    func toggleLike(for comment: Comment) {
        if likedCommentIds.contains(comment.id) {
            likedCommentIds.remove(comment.id)
        } else {
            likedCommentIds.insert(comment.id)
        }
    }

    func isLiked(_ comment: Comment) -> Bool {
        likedCommentIds.contains(comment.id)
    }
}
