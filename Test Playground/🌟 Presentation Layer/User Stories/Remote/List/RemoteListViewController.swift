//
//  RemoteListViewController.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper
import GKRepresentable

protocol RemoteListViewInput: ViperViewInput {
    func updateForSections(_ sections: [TableSectionModel])
}

protocol RemoteListViewOutput: ViperViewOutput {
    func selectAlbum(_ value: Album)
    func saveAlbum(_ value: Album)
}

class RemoteListViewController: ViperViewController, RemoteListViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet private weak var loadingView: UIView!
    @IBOutlet private weak var loadingViewLabel: UILabel!
    
    // MARK: - Props
    fileprivate var output: RemoteListViewOutput? {
        guard let output = self._output as? RemoteListViewOutput else { return nil }
        return output
    }
    
    public var sections: [TableSectionModel] = []
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.updateForSections([])
        self.output?.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = AppLocalization.List.title.localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.tableView.registerCellNib(AlbumItemCell.self)
        
        self.loadingView.isHidden = true
        
        self.loadingViewLabel.text = AppLocalization.General.loading.localized
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.backgroundColor = AppTheme.backgroundMain
        
        self.tableView.backgroundColor = .clear
        self.tableView.separatorColor = AppTheme.backgroundSeparator
        
        self.loadingViewLabel.apply(.bigTitleStyle())
    }
    
    // MARK: - RemoteListViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
    override func beginLoading() {
        super.beginLoading()
        
        DispatchQueue.main.async { [weak self] in
            guard let controller = self else { return }
            
            controller.loadingView.isHidden = false
        }
    }
    
    override func finishLoading(with error: Error?) {
        super.finishLoading(with: error)
        
        DispatchQueue.main.async { [weak self] in
            guard let controller = self else { return }
            
            controller.loadingView.isHidden = true
        }
    }
    
    func updateForSections(_ sections: [TableSectionModel]) {
        self.sections = sections
        
        DispatchQueue.main.async { [weak self] in
            guard let controller = self else { return }
            
            controller.tableView.reloadData()
        }
    }
    
}

// MARK: - Actions
extension RemoteListViewController { }

// MARK: - Module functions
extension RemoteListViewController { }

// MARK: - UITableViewDataSource
extension RemoteListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.sections[indexPath.section].rows[indexPath.row]
        
        if model is AlbumItemCellModel {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as? AlbumItemCell else { return UITableViewCell() }
            cell.model = model
            return cell
        }
        
        return UITableViewCell()
    }
    
}

// MARK: - UITableViewDelegate
extension RemoteListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = self.sections[indexPath.section].rows[indexPath.row]
        
        return model.cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        let model = self.sections[indexPath.section].rows[indexPath.row]
        
        if model is AlbumItemCellModel {
            return true
        }
        
        return false
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let model = self.sections[indexPath.section].rows[indexPath.row]
        
        if model is AlbumItemCellModel {
            let saveAction = UITableViewRowAction(style: .normal, title: AppLocalization.List.save.localized) { _, _ in
                guard let album = model.userInfo["album"] as? Album else { return }
                
                self.output?.saveAlbum(album)
            }
            saveAction.backgroundColor = AppTheme.accentMain
            
            return [saveAction]
        }
        
        return []
    }
    
}
