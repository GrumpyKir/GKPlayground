//
//  ServiceInteractor.swift
//  Test Playground
//
//  Created by  Кирилл on 4/16/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol ServiceInteractorInput: ViperInteractorInput { }

protocol ServiceInteractorOutput: ViperInteractorOutput { }

open class ServiceInteractor: ViperInteractor, ServiceInteractorInput {

    // MARK: - Props
    private var output: ServiceInteractorOutput? {
        guard let output = self._output as? ServiceInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - ServiceInteractorInput
    
    // MARK: - Module functions
}
