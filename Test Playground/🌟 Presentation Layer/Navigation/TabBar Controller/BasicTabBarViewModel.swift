//
//  BasicTabBarViewModel.swift
//  Test Playground
//
//  Created by  Кирилл on 4/15/19.
//

import UIKit

class BasicTabBarViewModel {
    var title: String
    var controller: UIViewController
    var image: UIImage?
    var selectedImage: UIImage?
    
    init(title: String, controller: UIViewController, image: UIImage? = nil, selectedImage: UIImage? = nil) {
        self.title = title
        self.controller = controller
        self.image = image
        self.selectedImage = selectedImage
    }
}
