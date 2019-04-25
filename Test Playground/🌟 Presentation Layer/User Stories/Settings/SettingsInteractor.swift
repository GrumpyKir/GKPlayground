//
//  SettingsInteractor.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol SettingsInteractorInput: ViperInteractorInput { }

protocol SettingsInteractorOutput: ViperInteractorOutput { }

open class SettingsInteractor: ViperInteractor, SettingsInteractorInput {

    // MARK: - Props
    private var output: SettingsInteractorOutput? {
        guard let output = self._output as? SettingsInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - SettingsInteractorInput
    
    // MARK: - Module functions
}
