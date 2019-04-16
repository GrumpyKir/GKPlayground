//
//  LocalListPresenter.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

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
    
    // MARK: - LocalListInteractorOutput
    
    // MARK: - Module functions
}
