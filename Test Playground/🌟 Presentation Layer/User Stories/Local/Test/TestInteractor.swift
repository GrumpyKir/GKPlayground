//
//  TestInteractor.swift
//  Test Playground
//
//  Created by  Кирилл on 5/23/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol TestInteractorInput: ViperInteractorInput { }

protocol TestInteractorOutput: ViperInteractorOutput { }

open class TestInteractor: ViperInteractor, TestInteractorInput {

    // MARK: - Props
    private var output: TestInteractorOutput? {
        guard let output = self._output as? TestInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - TestInteractorInput
    
    // MARK: - Module functions
}
