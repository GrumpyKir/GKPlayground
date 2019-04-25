//
//  AlbumItemCell.swift
//  Test Playground
//
//  Created by  Кирилл on 4/23/19.
//

import GKRepresentable

class AlbumItemCell: TableCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var albumImageBackground: UIView!
    @IBOutlet private weak var albumImageView: UIImageView!
    @IBOutlet private weak var albumLabel: UILabel!
    
    // MARK: - Setup functions
    override func setupView() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        self.albumImageBackground.backgroundColor = AppTheme.accentMain
        self.albumImageBackground.layer.cornerRadius = self.albumImageBackground.bounds.height * 0.5
        self.albumImageBackground.layer.masksToBounds = true
        
        self.albumImageView.image = AppAssets.albumLogo
        self.albumImageView.setImageColor(color: AppTheme.accentTextMain)
        self.albumImageView.contentMode = .scaleAspectFit
        self.albumImageView.clipsToBounds = true
        
        self.albumLabel.apply(.smallTitleStyle())
    }
    
    override func updateViews() {
        guard let model = self.model as? AlbumItemCellModel else { return }
        
        self.albumLabel.text = model.title
    }
    
    // MARK: - Module functions
    
}
