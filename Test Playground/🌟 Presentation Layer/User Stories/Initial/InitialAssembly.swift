//
//  InitialAssembly.swift
//  Test Playground
//
//  Created by  Кирилл on 3/14/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

enum InitialAssembly {
    
    // Create and return controller
    static func create() -> InitialViewController {
        return InitialViewController(nibName: InitialViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: InitialViewController) -> InitialPresenterInput {
        let presenter = InitialPresenter()
        
        let interactor = InitialInteractor()
        interactor._output = presenter
        
        let router = InitialRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
