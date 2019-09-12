//
//  TestRouter.swift
//  Test Playground
//
//  Created by  Кирилл on 5/23/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol TestRouterInput: ViperRouterInput { }

class TestRouter: ViperRouter, TestRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: TestViewController? {
        guard let mainController = self._mainController as? TestViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - TestRouterInput
    
    // MARK: - Module functions
}
