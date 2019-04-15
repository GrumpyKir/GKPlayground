//
//  PlaygroundRepository.swift
//  Test Playground
//
//  Created by  Кирилл on 3/14/19.
//

import GKUseCase

public class PlaygroundRepository: Repository {
    
    init() {
        super.init(modelName: AppConfiguration.databaseContainerName)
    }
    
}
