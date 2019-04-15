//
//  AlbumRemoteRouter.swift
//  Test Playground
//
//  Created by  Кирилл on 4/3/19.
//

import GKNetwork

enum AlbumRemoteRouter {
    case list
    case item(albumId: Int)
    
    var method: HTTPMethod {
        switch self {
        case .list,
             .item:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .list:
            return "\(AppConfiguration.serverURL)/albums"
        case let .item(albumId):
            return "\(AppConfiguration.serverURL)/albums/\(albumId)"
        }
    }
    
    var request: URLRequest? {
        switch self {
        case .list,
             .item:
            return RemoteFactory.request(path: self.path, parameters: nil, headers: nil, method: self.method)
        }
    }
}
