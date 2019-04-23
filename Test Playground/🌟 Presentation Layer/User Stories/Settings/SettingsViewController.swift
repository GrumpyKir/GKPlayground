//
//  SettingsViewController.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol SettingsViewInput: ViperViewInput { }

protocol SettingsViewOutput: ViperViewOutput { }

class SettingsViewController: ViperViewController, SettingsViewInput {

    // MARK: - Outlets
    
    // MARK: - Props
    fileprivate var output: SettingsViewOutput? {
        guard let output = self._output as? SettingsViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = AppLocalization.Settings.title.localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.backgroundColor = AppTheme.backgroundMain
    }
    
    // MARK: - SettingsViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension SettingsViewController { }

// MARK: - Module functions
extension SettingsViewController { }
