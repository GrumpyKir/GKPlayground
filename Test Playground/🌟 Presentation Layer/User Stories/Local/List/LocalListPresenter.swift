//
//  LocalListPresenter.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper
import GKRepresentable

protocol LocalListPresenterInput: ViperPresenterInput { }

class LocalListPresenter: ViperPresenter, LocalListPresenterInput, LocalListViewOutput, LocalListInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: LocalListViewInput? {
        guard let view = self._view as? LocalListViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: LocalListInteractorInput? {
        guard let interactor = self._interactor as? LocalListInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: LocalListRouterInput? {
        guard let router = self._router as? LocalListRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: LocalListViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = LocalListViewModel()
    }
    
    // MARK: - LocalListPresenterInput
    
    // MARK: - LocalListViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    override func reloadData() {
        self.interactor?.loadAlbums()
    }
    
    func selectAlbum(_ value: Album) {
        //
    }
    
    func deleteAlbum(_ value: Album) {
        self.interactor?.deleteAlbum(value)
    }
    
    // MARK: - LocalListInteractorOutput
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
