//
//  URLCaller.swift
//  Fooboo
//
//  Created by Shubhransh Gupta on 31/08/23.
//

import Foundation
import UIKit

extension URL {
    private static var baseUrl: String {
        return "https://api.unsplash.com/"
    }
    
    static func with(string: String) -> URL? {
        return URL(string: "\(baseUrl)\(string)")
    }
}

struct URLs: Codable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}

struct Image: Codable {
    let id: String
    let width: Int
    let height: Int
    let likes: Int
    let color: String
    let urls: URLs
    let keyNotExist: String?
}
