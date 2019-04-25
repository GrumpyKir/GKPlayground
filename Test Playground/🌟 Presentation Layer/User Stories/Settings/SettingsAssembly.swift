//
//  SettingsAssembly.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

enum SettingsAssembly {
    
    // Create and return controller
    static func create() -> SettingsViewController {
        return SettingsViewController(nibName: SettingsViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: SettingsViewController) -> SettingsPresenterInput {
        let presenter = SettingsPresenter()
        
        let interactor = SettingsInteractor()
        interactor._output = presenter
        
        let router = SettingsRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
