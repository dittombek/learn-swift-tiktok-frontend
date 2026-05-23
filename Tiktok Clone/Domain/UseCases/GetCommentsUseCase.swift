//
//  GetCommentsUseCase.swift
//  Tiktok Clone
//

struct GetCommentsUseCase {
    private let repository: CommentRepositoryProtocol

    init(repository: CommentRepositoryProtocol) {
        self.repository = repository
    }

    func execute(postId: String) -> [Comment] {
        return repository.getComments(postId: postId)
    }
}
