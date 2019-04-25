//
//  AlbumEntity+CoreDataClass.swift
//  Test Playground
//
//  Created by  Кирилл on 3/15/19.
//
//

import GKCoreData
import CoreData

@objc(AlbumEntity)
public class AlbumEntity: NSManagedObject {
    @NSManaged public var identifier: NSNumber
    @NSManaged public var title: String?
    @NSManaged public var photos: Set<PhotoEntity>
}

extension AlbumEntity {
    
    @objc(addPhotosObject:)
    @NSManaged public func addToPhotos(_ value: PhotoEntity)
    
    @objc(removePhotosObject:)
    @NSManaged public func removeFromPhotos(_ value: PhotoEntity)
    
    @objc(addPhotos:)
    @NSManaged public func addToPhotos(_ values: Set<PhotoEntity>)
    
    @objc(removePhotos:)
    @NSManaged public func removeFromPhotos(_ values: Set<PhotoEntity>)
    
}

extension AlbumEntity: LocalMappable {
    
    public func mapEntityToDomain() -> AnyObject {
        let album = Album(id: self.identifier.intValue)

        album.title = self.title ?? ""

        if let photos = Array(self.photos).map({ $0.mapEntityToDomain() }) as? [Photo] {
            album.photos = photos
        }
        return album
    }
    
    public func mapEntityFromDomain(data: AnyObject) {
        guard let album = data as? Album else { return }
        
        self.identifier = NSNumber(value: album.id)
        self.title = album.title
    }
    
}
