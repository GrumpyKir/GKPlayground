//
//  LocalListInteractor.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol LocalListInteractorInput: ViperInteractorInput {
    func loadAlbums()
    func deleteAlbum(_ album: Album)
}

protocol LocalListInteractorOutput: ViperInteractorOutput {
    func provideAlbums(_ value: [Album])
}

open class LocalListInteractor: ViperInteractor, LocalListInteractorInput {

    // MARK: - Props
    private var output: LocalListInteractorOutput? {
        guard let output = self._output as? LocalListInteractorOutput else {
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
    
    // MARK: - LocalListInteractorInput
    func loadAlbums() {
        self.output?.beginLoading()
        self.albumUseCase.fetchAlbumList()
    }
    
    func deleteAlbum(_ album: Album) {
        self.albumUseCase.deleteAlbums(albums: [album])
    }
    
    // MARK: - Module functions
    
}

extension LocalListInteractor: AlbumUseCaseOutput {
    
    func provideAlbums(_ value: [Album]) {
        self.output?.finishLoading(with: nil)
        self.output?.provideAlbums(value)
    }
    
}
