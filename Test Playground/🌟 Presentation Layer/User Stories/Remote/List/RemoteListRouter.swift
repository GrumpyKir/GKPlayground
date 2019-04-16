//
//  RemoteListRouter.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol RemoteListRouterInput: ViperRouterInput { }

class RemoteListRouter: ViperRouter, RemoteListRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: RemoteListViewController? {
        guard let mainController = self._mainController as? RemoteListViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - RemoteListRouterInput
    
    // MARK: - Module functions
}
