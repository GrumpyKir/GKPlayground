//
//  ServiceRouter.swift
//  Test Playground
//
//  Created by  Кирилл on 4/16/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol ServiceRouterInput: ViperRouterInput { }

class ServiceRouter: ViperRouter, ServiceRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: ServiceViewController? {
        guard let mainController = self._mainController as? ServiceViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - ServiceRouterInput
    
    // MARK: - Module functions
}
