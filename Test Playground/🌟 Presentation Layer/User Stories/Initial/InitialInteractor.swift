//
//  InitialInteractor.swift
//  Test Playground
//
//  Created by  Кирилл on 3/14/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol InitialInteractorInput: ViperInteractorInput { }

protocol InitialInteractorOutput: ViperInteractorOutput { }

open class InitialInteractor: ViperInteractor, InitialInteractorInput {

    // MARK: - Props
    private var output: InitialInteractorOutput? {
        guard let output = self._output as? InitialInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - InitialInteractorInput
    
    // MARK: - Module functions
}
