//
//  RemoteListInteractor.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol RemoteListInteractorInput: ViperInteractorInput { }

protocol RemoteListInteractorOutput: ViperInteractorOutput { }

open class RemoteListInteractor: ViperInteractor, RemoteListInteractorInput {

    // MARK: - Props
    private var output: RemoteListInteractorOutput? {
        guard let output = self._output as? RemoteListInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - RemoteListInteractorInput
    
    // MARK: - Module functions
}
