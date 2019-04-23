//
//  AlbumRepository.swift
//  Test Playground
//
//  Created by  Кирилл on 3/14/19.
//

import GKUseCase

protocol AlbumRepositoryInterface: RepositoryInterface {
    func localAlbum(id: Int, completion: @escaping (_ result: Album?) -> Void)
    func localAlbumList(completion: @escaping (_ result: [Album]) -> Void)
    func localUpdateAlbumList(albums: [Album], completion: @escaping (_ result: Bool) -> Void)
    func localDeleteAlbumList(albums: [Album], completion: @escaping (_ result: Bool) -> Void)
    
    func remoteAlbum(id: Int, completion: @escaping (_ result: Album?) -> Void)
    func remoteAlbumList(completion: @escaping (_ result: [Album]) -> Void)
}

class AlbumRepository: PlaygroundRepository, AlbumRepositoryInterface {
    
    // MARK: - Props
    override var entityClass: AnyClass {
        return AlbumEntity.self
    }
    
    // MARK: - AlbumRepositoryInterface
    func localAlbumList(completion: @escaping (_ result: [Album]) -> Void) {
        let request = AlbumLocalRouter.list(ids: []).request
        
        self.select(request) { (result, error) in
            if let mappedResult = result as? [Album], error == nil {
                completion(mappedResult)
            } else {
                completion([])
            }
        }
    }
    
    func localAlbum(id: Int, completion: @escaping (_ result: Album?) -> Void) {
        let request = AlbumLocalRouter.item(albumId: id).request
        
        self.select(request) { (result, error) in
            if let mappedResult = result?.first as? Album, error == nil {
                completion(mappedResult)
            } else {
                completion(nil)
            }
        }
    }
    
    func localUpdateAlbumList(albums: [Album], completion: @escaping (_ result: Bool) -> Void) {
        self.update(albums) { (result, error) in
            if !result.isEmpty, error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func localDeleteAlbumList(albums: [Album], completion: @escaping (_ result: Bool) -> Void) {
        let request = AlbumLocalRouter.list(ids: albums.map({ $0.id })).request
        
        self.delete(request) { (result, error) in
            if result, error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func remoteAlbumList(completion: @escaping (_ result: [Album]) -> Void) {
        guard let request = AlbumRemoteRouter.list.request else {
            completion([])
            
            return
        }
        
        self.execute(request, response: [AlbumResponse].self) { (result, _, error) in
            if let mappedResult = result as? [Album], error == nil {
                completion(mappedResult)
            } else {
                completion([])
            }
        }
    }
    
    func remoteAlbum(id: Int, completion: @escaping (_ result: Album?) -> Void) {
        guard let request = AlbumRemoteRouter.item(albumId: id).request else {
            completion(nil)
            
            return
        }
        
        self.execute(request, response: AlbumResponse.self) { (result, _, error) in
            if let mappedResult = result as? Album, error == nil {
                completion(mappedResult)
            } else {
                completion(nil)
            }
        }
    }
    
    // MARK: - Module functions
    
}
