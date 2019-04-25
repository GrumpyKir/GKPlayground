//
//  SettingsPresenter.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol SettingsPresenterInput: ViperPresenterInput { }

class SettingsPresenter: ViperPresenter, SettingsPresenterInput, SettingsViewOutput, SettingsInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: SettingsViewInput? {
        guard let view = self._view as? SettingsViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: SettingsInteractorInput? {
        guard let interactor = self._interactor as? SettingsInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: SettingsRouterInput? {
        guard let router = self._router as? SettingsRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: SettingsViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = SettingsViewModel()
    }
    
    // MARK: - SettingsPresenterInput
    
    // MARK: - SettingsViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    // MARK: - SettingsInteractorOutput
    
    // MARK: - Module functions
}
