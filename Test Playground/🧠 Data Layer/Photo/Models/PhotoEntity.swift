//
//  PhotoEntity.swift
//  Test Playground
//
//  Created by  Кирилл on 3/14/19.
//

import GKCoreData
import CoreData

@objc(PhotoEntity)
public class PhotoEntity: NSManagedObject {
    @NSManaged public var identifier: NSNumber
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var thumbnailUrl: String?
}

extension PhotoEntity: LocalMappable {
    
    public func mapEntityToDomain() -> AnyObject {
        let photo = Photo(id: self.identifier.intValue)
        
        photo.title = self.title ?? ""
        if let url = self.url {
            photo.url = URL(string: url)
        }
        if let thumbnailUrl = self.thumbnailUrl {
            photo.thumbnailUrl = URL(string: thumbnailUrl)
        }
        
        return photo
    }
    
    public func mapEntityFromDomain(data: AnyObject) {
        guard let photo = data as? Photo else { return }
        
        self.identifier = NSNumber(value: photo.id)
        self.title = photo.title
        self.url = photo.url?.absoluteString
        self.thumbnailUrl = photo.thumbnailUrl?.absoluteString
    }
    
}
