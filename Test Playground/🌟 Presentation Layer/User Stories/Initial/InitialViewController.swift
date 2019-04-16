//
//  InitialViewController.swift
//  Test Playground
//
//  Created by  Кирилл on 3/14/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol InitialViewInput: ViperViewInput { }

protocol InitialViewOutput: ViperViewOutput {
    func finishStartupAnimation()
}

class InitialViewController: ViperViewController, InitialViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var appLogoImageView: UIImageView!
    @IBOutlet private weak var appLogoImageViewVertical: NSLayoutConstraint!
    @IBOutlet private weak var appTitleLabel: UILabel!
    @IBOutlet private weak var appTitleLabelTop: NSLayoutConstraint!
    
    // MARK: - Props
    fileprivate var output: InitialViewOutput? {
        guard let output = self._output as? InitialViewOutput else { return nil }
        return output
    }
    
    private let kLogoPositionOffset: CGFloat = -30.0
    private let kTitlePositionOffset: CGFloat = 16.0
    
    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.performInitialAnimation()
    }
    
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.appLogoImageView.image = AppAssets.appLogo
        
        self.appTitleLabel.alpha = 0.0
        self.appTitleLabel.text = AppLocalization.title.localized
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.appTitleLabel.apply(.appTitleStyle())
    }
    
    // MARK: - InitialViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension InitialViewController { }

// MARK: - Module functions
extension InitialViewController {
    
    private func performInitialAnimation() {
        self.appLogoImageViewVertical.constant = self.kLogoPositionOffset
        self.appTitleLabelTop.constant = self.kTitlePositionOffset
        
        UIView.animate(withDuration: 1.0, animations: {
            self.appTitleLabel.alpha = 1.0
            self.view.layoutIfNeeded()
        }) { _ in
            self.output?.finishStartupAnimation()
        }
    }
    
}
