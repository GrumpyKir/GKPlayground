//
//  LocalListViewController.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper
import GKRepresentable

protocol LocalListViewInput: RemoteListViewInput { }

protocol LocalListViewOutput: ViperViewOutput {
    func selectAlbum(_ value: Album)
    func deleteAlbum(_ value: Album)
}

class LocalListViewController: RemoteListViewController, LocalListViewInput {

    // MARK: - Outlets
    
    // MARK: - Props
    fileprivate var output: LocalListViewOutput? {
        guard let output = self._output as? LocalListViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.updateForSections([])
        self.output?.reloadData()
    }
    
    // MARK: - Setup functions
    
    // MARK: - LocalListViewInput
    
}

// MARK: - Actions
extension LocalListViewController { }

// MARK: - Module functions
extension LocalListViewController { }

// MARK: - UITableViewDelegate
extension LocalListViewController {
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let model = self.sections[indexPath.section].rows[indexPath.row]
        
        if model is AlbumItemCellModel {
            let deleteAction = UITableViewRowAction(style: .destructive, title: AppLocalization.List.delete.localized) { _, _ in
                guard let album = model.userInfo["album"] as? Album else { return }
                
                self.output?.deleteAlbum(album)
                
                self.sections[indexPath.section].rows.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            deleteAction.backgroundColor = .red
            
            return [deleteAction]
        }
        
        return []
    }
    
}
