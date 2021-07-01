//
//  CharactersService.swift
//  RxSwiftAndMova
//
//  Created by Alessandro Pace on 29/6/21.
//

import Foundation
import Moya

enum CharactersService {
    case getCharacters
}

extension CharactersService: TargetType {
    var baseURL: URL {
        return URL(string: "https://swapi.dev/api/")!
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "people"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCharacters:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getCharacters:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Typer":"application/json"]
    }
    
}
