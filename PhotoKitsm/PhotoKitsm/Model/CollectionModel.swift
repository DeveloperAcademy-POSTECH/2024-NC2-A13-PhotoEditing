//
//  CollectionModel.swift
//  PhotoKitsm
//
//  Created by Lee Sihyeong on 6/18/24.
//

import Foundation
import SwiftUI

struct Completed: Identifiable, Codable {
    var id = UUID()
    let image: UIImage
    let title: String
    let date: String
}


class CollectionModel {
    @AppStorage("collection") var collection: [Completed] = []
}

extension Completed: RawRepresentable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode(Completed.self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
