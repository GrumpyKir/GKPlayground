//
//  Photo.swift
//  Test Playground
//
//  Created by  Кирилл on 3/15/19.
//

import UIKit

public class Photo: Equatable {
    var id: Int
    var title: String
    var url: URL?
    var thumbnailUrl: URL?
    
    init(id: Int) {
        self.id = id
        self.title = ""
    }
    
    public static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.id == rhs.id
            && lhs.title == rhs.title
            && lhs.url == rhs.url
            && lhs.thumbnailUrl == rhs.thumbnailUrl
    }
}
