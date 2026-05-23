//
//  CommentRepositoryProtocol.swift
//  Tiktok Clone
//

protocol CommentRepositoryProtocol {
    func getComments(postId: String) -> [Comment]
}
