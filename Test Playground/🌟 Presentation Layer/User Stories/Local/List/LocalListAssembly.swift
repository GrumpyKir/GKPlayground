//
//  LocalListAssembly.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

enum LocalListAssembly {
    
    // Create and return controller
    static func create() -> LocalListViewController {
        return LocalListViewController(nibName: LocalListViewController.identifier, bundle: nil)
    }
    
    
    
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: LocalListViewController) -> LocalListPresenterInput {
        let presenter = LocalListPresenter()
        
        let interactor = LocalListInteractor()
        interactor._output = presenter
        
        let router = LocalListRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
