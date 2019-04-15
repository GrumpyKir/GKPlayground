//
//  InitialViewController.swift
//  Test Playground
//
//  Created by  Кирилл on 3/14/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol InitialViewInput: ViperViewInput { }

protocol InitialViewOutput: ViperViewOutput { }

class InitialViewController: ViperViewController, InitialViewInput {

    // MARK: - Outlets
    
    // MARK: - Props
    fileprivate var output: InitialViewOutput? {
        guard let output = self._output as? InitialViewOutput else { return nil }
        return output
    }
    
    fileprivate lazy var repository: AlbumRepository = AlbumRepository()
    
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
    
    func applyStyles() { }
    
    // MARK: - InitialViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension InitialViewController {
    
    @IBAction private func tapAddButton(_ sender: Any) {
        let album = Album(id: 4)
        album.title = "Test 4"
        
        self.repository.localAddAlbum(data: album)
    }
    
    @IBAction private func tapPrintButton(_ sender: Any) {
//        self.repository.remoteAlbumList()
        
        self.repository.remoteAlbum(id: 1)
        
//        self.repository.localAlbumList()
    }
    
    @IBAction private func tapRemoveButton(_ sender: Any) {
        let album = Album(id: 2)
        self.repository.localRemoveAlbum(data: album)
    }
    
}

// MARK: - Module functions
extension InitialViewController { }
