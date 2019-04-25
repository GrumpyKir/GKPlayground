//
//  AlbumItemCellModel.swift
//  Test Playground
//
//  Created by  Кирилл on 4/23/19.
//

import GKRepresentable

class AlbumItemCellModel: TableCellModel {
    
    public override var cellIdentifier: String {
        return AlbumItemCell.identifier
    }
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
}
