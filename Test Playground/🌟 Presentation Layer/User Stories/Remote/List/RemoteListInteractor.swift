//
//  RemoteListInteractor.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol RemoteListInteractorInput: ViperInteractorInput {
    func loadAlbums()
    func saveAlbum(_ album: Album)
}

protocol RemoteListInteractorOutput: ViperInteractorOutput {
    func provideAlbums(_ value: [Album])
}

open class RemoteListInteractor: ViperInteractor, RemoteListInteractorInput {

    // MARK: - Props
    private var output: RemoteListInteractorOutput? {
        guard let output = self._output as? RemoteListInteractorOutput else {
            return nil
        }
        return output
    }
    
    var albumUseCase: AlbumUseCaseInput
    
    // MARK: - Initialization
    override init() {
        self.albumUseCase = AlbumUseCase()
        
        super.init()
        
        self.albumUseCase.subscribe(with: self)
    }
    
    // MARK: - RemoteListInteractorInput
    func loadAlbums() {
        self.output?.beginLoading()
        self.albumUseCase.getAlbumList()
    }
    
    func saveAlbum(_ album: Album) {
        self.albumUseCase.saveAlbums(albums: [album])
    }
    
    // MARK: - Module functions
}

extension RemoteListInteractor: AlbumUseCaseOutput {
    
    func provideAlbums(_ value: [Album]) {
        self.output?.finishLoading(with: nil)
        self.output?.provideAlbums(value)
    }
    
}
