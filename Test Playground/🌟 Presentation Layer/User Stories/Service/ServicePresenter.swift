//
//  ServicePresenter.swift
//  Test Playground
//
//  Created by  Кирилл on 4/16/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol ServicePresenterInput: ViperPresenterInput { }

class ServicePresenter: ViperPresenter, ServicePresenterInput, ServiceViewOutput, ServiceInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: ServiceViewInput? {
        guard let view = self._view as? ServiceViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: ServiceInteractorInput? {
        guard let interactor = self._interactor as? ServiceInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: ServiceRouterInput? {
        guard let router = self._router as? ServiceRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: ServiceViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = ServiceViewModel()
    }
    
    // MARK: - ServicePresenterInput
    
    // MARK: - ServiceViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    // MARK: - ServiceInteractorOutput
    
    // MARK: - Module functions
}
