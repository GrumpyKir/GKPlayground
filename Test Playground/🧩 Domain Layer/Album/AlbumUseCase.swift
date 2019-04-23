//
//  AlbumUseCase.swift
//  Test Playground
//
//  Created by  Кирилл on 3/15/19.
//

import GKUseCase

protocol AlbumUseCaseInput: UseCaseInput {
    func getAlbumList()
    
    func fetchAlbumList()
    func saveAlbums(albums: [Album])
    func deleteAlbums(albums: [Album])
}

protocol AlbumUseCaseOutput: UseCaseOutput {
    func provideAlbums(_ value: [Album])
}

class AlbumUseCase: UseCase, AlbumUseCaseInput {
    
    // MARK: - Props
    private var output: AlbumUseCaseOutput? {
        guard let output = self._output as? AlbumUseCaseOutput else {
            return nil
        }
        return output
    }
    
    public var albumRepository: AlbumRepositoryInterface
    
    // MARK: - Initialization
    override init() {
        self.albumRepository = AlbumRepository()
    }
    
    // MARK: - AlbumUseCaseInput
    func getAlbumList() {
        self.albumRepository.remoteAlbumList { result in
            self.output?.provideAlbums(result)
        }
    }
    
    func fetchAlbumList() {
        self.albumRepository.localAlbumList { result in
            self.output?.provideAlbums(result)
        }
    }
    
    func saveAlbums(albums: [Album]) {
        self.albumRepository.localUpdateAlbumList(albums: albums) { _ in
            //
        }
    }
    
    func deleteAlbums(albums: [Album]) {
        self.albumRepository.localDeleteAlbumList(albums: albums) { _ in
            //
        }
    }
    
}
