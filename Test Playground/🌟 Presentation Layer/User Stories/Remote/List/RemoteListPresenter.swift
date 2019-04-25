//
//  RemoteListPresenter.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper
import GKRepresentable

protocol RemoteListPresenterInput: ViperPresenterInput { }

class RemoteListPresenter: ViperPresenter, RemoteListPresenterInput, RemoteListViewOutput, RemoteListInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: RemoteListViewInput? {
        guard let view = self._view as? RemoteListViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: RemoteListInteractorInput? {
        guard let interactor = self._interactor as? RemoteListInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: RemoteListRouterInput? {
        guard let router = self._router as? RemoteListRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: RemoteListViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = RemoteListViewModel()
    }
    
    // MARK: - RemoteListPresenterInput
    
    // MARK: - RemoteListViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    override func reloadData() {
        self.interactor?.loadAlbums()
    }
    
    func selectAlbum(_ value: Album) {
        //
    }
    
    func saveAlbum(_ value: Album) {
        self.interactor?.saveAlbum(value)
    }
    
    // MARK: - RemoteListInteractorOutput
    func provideAlbums(_ value: [Album]) {
        self.makeSectionsModel(with: value)
    }
    
    // MARK: - Module functions
    private func makeSectionsModel(with albums: [Album]) {
        let albumSection = TableSectionModel()
        
        for album in albums {
            let albumRow = AlbumItemCellModel(title: album.title)
            albumRow.userInfo["album"] = album
            albumSection.rows.append(albumRow)
        }
        
        if albumSection.rows.isEmpty {
            self.view?.updateForSections([])
        } else {
            self.view?.updateForSections([albumSection])
        }
    }
}
