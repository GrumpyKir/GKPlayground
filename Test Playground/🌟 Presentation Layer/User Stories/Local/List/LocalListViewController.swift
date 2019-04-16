//
//  LocalListViewController.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol LocalListViewInput: ViperViewInput { }

protocol LocalListViewOutput: ViperViewOutput { }

class LocalListViewController: ViperViewController, LocalListViewInput {

    // MARK: - Outlets
    
    // MARK: - Props
    fileprivate var output: LocalListViewOutput? {
        guard let output = self._output as? LocalListViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = AppLocalization.List.title.localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.backgroundColor = AppTheme.backgroundMain
    }
    
    // MARK: - LocalListViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension LocalListViewController { }

// MARK: - Module functions
extension LocalListViewController { }
