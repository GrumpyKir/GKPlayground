//
//  RemoteListAssembly.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

enum RemoteListAssembly {
    
    // Create and return controller
    static func create() -> RemoteListViewController {
        return RemoteListViewController(nibName: RemoteListViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: RemoteListViewController) -> RemoteListPresenterInput {
        let presenter = RemoteListPresenter()
        
        let interactor = RemoteListInteractor()
        interactor._output = presenter
        
        let router = RemoteListRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
