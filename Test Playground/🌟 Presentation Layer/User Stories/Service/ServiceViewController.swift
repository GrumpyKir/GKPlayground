//
//  ServiceViewController.swift
//  Test Playground
//
//  Created by  Кирилл on 4/16/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol ServiceViewInput: ViperViewInput { }

protocol ServiceViewOutput: ViperViewOutput { }

class ServiceViewController: ViperViewController, ServiceViewInput {

    // MARK: - Outlets
    
    // MARK: - Props
    fileprivate var output: ServiceViewOutput? {
        guard let output = self._output as? ServiceViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = "".localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.backgroundColor = AppTheme.backgroundMain        
    }
    
    // MARK: - ServiceViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension ServiceViewController { }

// MARK: - Module functions
extension ServiceViewController { }
