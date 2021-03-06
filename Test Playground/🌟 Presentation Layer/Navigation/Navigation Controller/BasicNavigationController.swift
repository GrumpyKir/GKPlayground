//
//  BasicNavigationController.swift
//  Test Playground
//
//  Created by  Кирилл on 3/6/19.
//

import UIKit

class BasicNavigationController: UINavigationController {
    
    // MARK: - Creation
    class func create(with rootController: UIViewController) -> BasicNavigationController {
        let nc = BasicNavigationController(rootViewController: rootController)
        return nc
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: - Setup functions
    private func setupComponents() {
        self.navigationBar.isTranslucent = true
        self.navigationBar.barTintColor = AppTheme.backgroundBar
        self.navigationBar.tintColor = AppTheme.textMain
        self.navigationBar.titleTextAttributes = [.font: PTRootUI.bold.font(size: 20.0),
                                                  .foregroundColor: AppTheme.textMain]
        
        if #available(iOS 11.0, *) {
            self.navigationBar.prefersLargeTitles = false
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return AppTheme.statusBarStyle
    }
    
}
