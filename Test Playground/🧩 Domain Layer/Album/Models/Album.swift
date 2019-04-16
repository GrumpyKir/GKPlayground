//
//  Albun.swift
//  Test Playground
//
//  Created by  Кирилл on 3/15/19.
//

import UIKit

public class Album: Equatable {
    var id: Int
    var title: String
    var photos: [Photo]
    
    init(id: Int) {
        self.id = id
        self.title = ""
        self.photos = []
    }
    
    static public func == (lhs: Album, rhs: Album) -> Bool {
        return lhs.id == rhs.id
            && lhs.title == rhs.title
            && lhs.photos == rhs.photos
    }
}
