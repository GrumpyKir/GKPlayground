//
//  TestPresenter.swift
//  Test Playground
//
//  Created by  Кирилл on 5/23/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol TestPresenterInput: ViperPresenterInput { }

class TestPresenter: ViperPresenter, TestPresenterInput, TestViewOutput, TestInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: TestViewInput? {
        guard let view = self._view as? TestViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: TestInteractorInput? {
        guard let interactor = self._interactor as? TestInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: TestRouterInput? {
        guard let router = self._router as? TestRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: TestViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = TestViewModel()
    }
    
    // MARK: - TestPresenterInput
    
    // MARK: - TestViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    // MARK: - TestInteractorOutput
    
    // MARK: - Module functions
}
