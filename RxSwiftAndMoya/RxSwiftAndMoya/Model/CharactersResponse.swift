//
//  CharactersResponse.swift
//  RxSwiftAndMova
//
//  Created by Alessandro Pace on 29/6/21.
//

import Foundation

struct CharactersResponse: Mappable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [Character]?
}
