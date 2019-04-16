//
//  LocalListInteractor.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol LocalListInteractorInput: ViperInteractorInput { }

protocol LocalListInteractorOutput: ViperInteractorOutput { }

open class LocalListInteractor: ViperInteractor, LocalListInteractorInput {

    // MARK: - Props
    private var output: LocalListInteractorOutput? {
        guard let output = self._output as? LocalListInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - LocalListInteractorInput
    
    // MARK: - Module functions
}
