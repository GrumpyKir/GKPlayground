//
//  BasicTabBarAssembly.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//

import UIKit

class BasicTabBarAssembly: UITabBarController {
    
    class func create(with controllersData: [BasicTabBarViewModel]) -> UITabBarController {
        let tabBarController = UITabBarController()
        
        var rootControllers: [UIViewController] = []
        for controllerData in controllersData {
            let rootController = controllerData.controller
            let controllerNavigation = BasicNavigationController.create(with: rootController)
            controllerNavigation.tabBarItem = UITabBarItem(title: controllerData.title, image: controllerData.image, selectedImage: controllerData.selectedImage)
            rootControllers.append(controllerNavigation)
        }
        
        tabBarController.viewControllers = rootControllers
        
        return tabBarController
    }
    
    class func configure(with controller: UITabBarController) {
        controller.selectedIndex = 0
        
        controller.tabBar.isTranslucent = true
        controller.tabBar.barTintColor = AppTheme.backgroundBar
        controller.tabBar.tintColor = AppTheme.accentMain
        controller.tabBar.unselectedItemTintColor = AppTheme.textSub
        
        guard let tabBarItems = controller.tabBar.items else { return }
        for item in tabBarItems {
            item.setTitleTextAttributes([.font: PTRootUI.regular.font(size: 12.0)],
                                        for: .normal)
        }
    }
    
}
