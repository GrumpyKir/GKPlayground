//
//  LocalListRouter.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol LocalListRouterInput: ViperRouterInput { }

class LocalListRouter: ViperRouter, LocalListRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: LocalListViewController? {
        guard let mainController = self._mainController as? LocalListViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - LocalListRouterInput
    func test() {
        let vc = TestAssembly.create()
        _ = TestAssembly.configure(with: vc)
        
        self.present(vc, animated: true)
    }
    
    // MARK: - Module functions
}
