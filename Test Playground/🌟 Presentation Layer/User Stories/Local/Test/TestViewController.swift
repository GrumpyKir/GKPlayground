//
//  TestViewController.swift
//  Test Playground
//
//  Created by  Кирилл on 5/23/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol TestViewInput: ViperViewInput { }

protocol TestViewOutput: ViperViewOutput { }

class TestViewController: ViperViewController, TestViewInput {

    // MARK: - Outlets
    
    // MARK: - Props
    fileprivate var output: TestViewOutput? {
        guard let output = self._output as? TestViewOutput else { return nil }
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
    
    func applyStyles() { }
    
    // MARK: - TestViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension TestViewController { }

// MARK: - Module functions
extension TestViewController { }
