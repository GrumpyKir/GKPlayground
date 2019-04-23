//
//  AlbumByIdUseCase.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//

import GKUseCase

protocol AlbumByIdUseCaseInput: AlbumUseCaseInput {
    var identifier: Int? { get set }
    
    func getAlbum()    
    func fetchAlbum()
}

protocol AlbumByIdUseCaseOutput: AlbumUseCaseOutput {
    func provideAlbum(_ value: Album?)
}

class AlbumByIdUseCase: AlbumUseCase, AlbumByIdUseCaseInput {
    
    // MARK: - Props
    private var output: AlbumByIdUseCaseOutput? {
        guard let output = self._output as? AlbumByIdUseCaseOutput else {
            return nil
        }
        return output
    }
    
    var identifier: Int?
    
    // MARK: - Initialization
    override init() {
        super.init()
    }
    
    // MARK: - AlbumByIdUseCaseInput
    func getAlbum() {
        guard let identifier = self.identifier else {
            self.output?.provideAlbum(nil)
            
            return
        }
        self.albumRepository.remoteAlbum(id: identifier) { result in
            self.output?.provideAlbum(result)
        }
    }
    
    func fetchAlbum() {
        guard let identifier = self.identifier else {
            self.output?.provideAlbum(nil)
            
            return
        }
        self.albumRepository.localAlbum(id: identifier) { result in
            self.output?.provideAlbum(result)
        }
    }
    
    func saveAlbum(album: Album) {
//        self.albumRepository.
    }
    
}
