//
//  TestAssembly.swift
//  Test Playground
//
//  Created by  Кирилл on 5/23/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

enum TestAssembly {
    
    // Create and return controller
    static func create() -> TestViewController {
        return TestViewController(nibName: TestViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: TestViewController) -> TestPresenterInput {
        let presenter = TestPresenter()
        
        let interactor = TestInteractor()
        interactor._output = presenter
        
        let router = TestRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
