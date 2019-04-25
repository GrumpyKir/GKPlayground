//
//  SettingsRouter.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol SettingsRouterInput: ViperRouterInput { }

class SettingsRouter: ViperRouter, SettingsRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: SettingsViewController? {
        guard let mainController = self._mainController as? SettingsViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - SettingsRouterInput
    
    // MARK: - Module functions
}
