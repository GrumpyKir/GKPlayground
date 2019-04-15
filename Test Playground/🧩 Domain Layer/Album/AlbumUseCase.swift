//
//  AlbumUseCase.swift
//  Test Playground
//
//  Created by  Кирилл on 3/15/19.
//

import GKUseCase

protocol AlbumUseCaseInput: UseCaseInput { }

protocol AlbumUseCaseOutput: UseCaseOutput { }

class AlbumUseCase: UseCase, AlbumUseCaseInput {
    
    // MARK: - Props
    private var albumRepository: AlbumRepositoryInterface
    
    // MARK: - Initialization
    override init() {
        self.albumRepository = AlbumRepository()
    }
    
    // MARK: - AlbumUseCaseInterface
    
}
