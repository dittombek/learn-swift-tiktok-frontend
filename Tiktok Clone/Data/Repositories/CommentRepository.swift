//
//  CommentRepository.swift
//  Tiktok Clone
//

struct CommentRepository: CommentRepositoryProtocol {
    private let dataSource: CommentMockDataSource

    init(dataSource: CommentMockDataSource = CommentMockDataSource()) {
        self.dataSource = dataSource
    }

    func getComments(postId: String) -> [Comment] {
        return dataSource.fetchComments(postId: postId)
    }
}
