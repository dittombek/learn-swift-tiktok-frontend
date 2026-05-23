//
//  CommentMockDataSource.swift
//  Tiktok Clone
//

struct CommentMockDataSource {
    func fetchComments(postId: String) -> [Comment] {
        return [
            Comment(id: "1", username: "user_one", text: "Nice video!", likeCount: 42),
            Comment(id: "2", username: "user_two", text: "So cool 🔥", likeCount: 17),
            Comment(id: "3", username: "user_three", text: "Love this content", likeCount: 8),
        ]
    }
}
