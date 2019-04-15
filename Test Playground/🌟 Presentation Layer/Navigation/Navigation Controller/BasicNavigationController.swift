//
//  BasicNavigationController.swift
//  Test Playground
//
//  Created by  Кирилл on 3/6/19.
//

import UIKit

class BasicNavigationController: UINavigationController {
    
    class func create(with rootController: UIViewController) -> BasicNavigationController {
        let nc = BasicNavigationController(rootViewController: rootController)
        return nc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    private func setupUI() {
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = AppTheme.backgroundBar
        self.navigationBar.tintColor = AppTheme.accentText
        self.navigationBar.titleTextAttributes = [.font: PTRootUI.bold.font(size: 20.0),
                                                  .foregroundColor: AppTheme.accentText]
        
        if #available(iOS 11.0, *) {
            self.navigationBar.prefersLargeTitles = false
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return AppTheme.statusBarStyle
    }
    
}
