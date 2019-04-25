//
//  AlbumResponse.swift
//  Test Playground
//
//  Created by  Кирилл on 3/15/19.
//

import GKNetwork

class AlbumResponse: Codable {
    var id: Int?
    var userId: Int?
    var title: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case userId = "userId"
        case title = "title"
    }
}

extension AlbumResponse: RemoteMappable {
    
    func mapResponseToDomain() -> AnyObject? {
        guard let id = self.id else { return nil }
        
        let album = Album(id: id)
        album.title = self.title ?? ""
        
        return album
    }
    
}
