//
//  InitialRouter.swift
//  Test Playground
//
//  Created by  Кирилл on 3/14/19.
//  Copyright © 2019 ___ORGANIZATIONNAME___. All rights reserved.
//

import GKViper

protocol InitialRouterInput: ViperRouterInput {
    func presentMainApplication()
}

class InitialRouter: ViperRouter, InitialRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: InitialViewController? {
        guard let mainController = self._mainController as? InitialViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - InitialRouterInput
    func presentMainApplication() {
        let remoteListVC = RemoteListAssembly.create()
        _ = RemoteListAssembly.configure(with: remoteListVC)
        
        let localListVC = LocalListAssembly.create()
        _ = LocalListAssembly.configure(with: localListVC)
        
        let serviceVC = ServiceAssembly.create()
        _ = ServiceAssembly.configure(with: serviceVC)
        
        let settingsVC = SettingsAssembly.create()
        _ = SettingsAssembly.configure(with: settingsVC)
        
        let viewModel = [BasicTabBarViewModel(title: AppLocalization.Tabs.network.localized,
                                              controller: remoteListVC,
                                              image: AppAssets.tabRemote,
                                              selectedImage: nil),
                         BasicTabBarViewModel(title: AppLocalization.Tabs.local.localized,
                                              controller: localListVC,
                                              image: AppAssets.tabLocal,
                                              selectedImage: nil),
                         BasicTabBarViewModel(title: AppLocalization.Tabs.service.localized,
                                              controller: serviceVC,
                                              image: AppAssets.tabService,
                                              selectedImage: nil),
                         BasicTabBarViewModel(title: AppLocalization.Tabs.settings.localized,
                                              controller: settingsVC,
                                              image: AppAssets.tabSettings,
                                              selectedImage: nil)]
        
        let tabBarController = BasicTabBarAssembly.create(with: viewModel)
        BasicTabBarAssembly.configure(with: tabBarController)
        
        tabBarController.modalTransitionStyle = .crossDissolve
        
        self.present(tabBarController, animated: true)
    }
    
    // MARK: - Module functions
}
