//
//  ServiceAssembly.swift
//  Test Playground
//
//  Created by  Кирилл on 4/16/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

enum ServiceAssembly {
    
    // Create and return controller
    static func create() -> ServiceViewController {
        return ServiceViewController(nibName: ServiceViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: ServiceViewController) -> ServicePresenterInput {
        let presenter = ServicePresenter()
        
        let interactor = ServiceInteractor()
        interactor._output = presenter
        
        let router = ServiceRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
