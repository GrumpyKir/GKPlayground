//
//  AlbumLocalRouter.swift
//  Test Playground
//
//  Created by  Кирилл on 4/3/19.
//

import GKCoreData
import CoreData

enum AlbumLocalRouter {
    case list
    case item(albumId: Int)
    
    var entityClass: AnyClass {
        return AlbumEntity.self
    }
    
    var request: NSFetchRequest<NSManagedObject> {
        switch self {
        case .list:
            let byIdDescriptor = LocalFactory.sortDescriptor(key: "identifier", ascending: true)
            return LocalFactory.request(self.entityClass, predicate: nil, sortDescriptors: [byIdDescriptor])
        case let .item(albumId):
            let predicate = NSPredicate(format: "identifier = %@", albumId)
            return LocalFactory.request(self.entityClass, predicate: predicate, sortDescriptors: nil)
        }
    }
}
