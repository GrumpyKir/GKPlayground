//
//  AlbumLocalRouter.swift
//  Test Playground
//
//  Created by  Кирилл on 4/3/19.
//

import GKCoreData
import CoreData

enum AlbumLocalRouter {
    case list(ids: [Int])
    case item(albumId: Int)
    
    var entityClass: AnyClass {
        return AlbumEntity.self
    }
    
    var request: NSFetchRequest<NSManagedObject> {
        switch self {
        case let .list(ids):
            var predicate: NSPredicate?
            if !ids.isEmpty {
                predicate = NSPredicate(format: "identifier IN %@", ids.map({ NSNumber(value: $0) }))
            }
            
            let byIdDescriptor = LocalFactory.sortDescriptor(key: "identifier", ascending: true)
            return LocalFactory.request(self.entityClass, predicate: predicate, sortDescriptors: [byIdDescriptor])
        case let .item(albumId):
            let predicate = NSPredicate(format: "identifier = %@", NSNumber(value: albumId))
            return LocalFactory.request(self.entityClass, predicate: predicate, sortDescriptors: nil)
        }
    }
}
