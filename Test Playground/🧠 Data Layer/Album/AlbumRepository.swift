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
    
    func remoteAlbum(id: Int, completion: @escaping (_ result: Album?) -> Void)
    func remoteAlbumList(completion: @escaping (_ result: [Album]) -> Void)
}

class AlbumRepository: PlaygroundRepository, AlbumRepositoryInterface {
        
    // MARK: - AlbumRepositoryInterface
    func localAlbumList(completion: @escaping (_ result: [Album]) -> Void) {
        let request = AlbumLocalRouter.list.request
        
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
