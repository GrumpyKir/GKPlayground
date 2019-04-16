//
//  RemoteListPresenter.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

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
    
    // MARK: - RemoteListInteractorOutput
    
    // MARK: - Module functions
}
