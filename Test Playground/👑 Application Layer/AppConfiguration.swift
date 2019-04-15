//
//  AppConfiguration.swift
//  Test Playground
//
//  Created by  Кирилл on 3/14/19.
//

import Foundation

enum AppConfiguration {
    
    static var serverURL: String {
        #if DEBUG
        return "https://jsonplaceholder.typicode.com"
        #else
        return "https://jsonplaceholder.typicode.com"
        #endif
    }
    
    static var databaseContainerName: String {
        return "Playground"
    }
    
}
