//
//  AlbumRepository.swift
//  Test Playground
//
//  Created by  Кирилл on 3/14/19.
//

import GKUseCase

protocol AlbumRepositoryInterface: RepositoryInterface {
    func localAlbumList()
    func localAlbum(id: Int)
    
    func localAddAlbum(data: Album)
    func localAddAlbums(data: [Album])
    
    func localRemoveAlbum(data: Album)
    
    func remoteAlbumList()
    func remoteAlbum(id: Int)
}

class AlbumRepository: PlaygroundRepository, AlbumRepositoryInterface {
        
    // MARK: - AlbumRepositoryInterface
    func localAlbumList() {
        let request = AlbumLocalRouter.list.request
        
        self.select(request) { (result, _) in
            if let mappedResult = result as? [Album] {
                print(mappedResult)
                for album in mappedResult {
                    print(album.id)
                    print(album.title)
                }
            }
        }
    }
    
    func localAlbum(id: Int) {
        let request = AlbumLocalRouter.item(albumId: id).request
        
        self.select(request) { (result, _) in
            if let mappedResult = result as? [Album] {
                print(mappedResult)
                for album in mappedResult {
                    print(album.id)
                    print(album.title)
                }
            }
        }
    }
    
    func localAddAlbum(data: Album) {
        self.update(data) { (result, _) in
            if let mappedResult = result as? Album {
                print(mappedResult)
            }
        }
    }
    
    func localAddAlbums(data: [Album]) {
        self.update(data) { (result, _) in
            if let mappedResult = result as? [Album] {
                print(mappedResult)
                for album in mappedResult {
                    print(album.id)
                    print(album.title)
                }
            }
        }
    }
    
    func localRemoveAlbum(data: Album) {
        let request = AlbumLocalRouter.item(albumId: data.id).request
        
        self.delete(request) { (result, _) in
            print(result)
        }
    }
    
    func remoteAlbumList() {
        guard let request = AlbumRemoteRouter.list.request else { return }

        self.execute(request, response: [AlbumResponse].self) { (result, _, _) in
            if let mappedResult = result as? [Album] {
                print(mappedResult)
                for album in mappedResult {
                    print(album.id)
                    print(album.title)
                }
            }
        }
    }
    
    func remoteAlbum(id: Int) {
        guard let request = AlbumRemoteRouter.item(albumId: id).request else { return }
        
        self.execute(request, response: AlbumResponse.self) { (result, _, _) in
            if let mappedResult = result as? Album {
                print(mappedResult.id)
                print(mappedResult.title)
            }
        }
    }
    
    // MARK: - Module functions
    
}
