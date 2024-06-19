//
//  CollectionModel.swift
//  PhotoKitsm
//
//  Created by Lee Sihyeong on 6/18/24.
//

import Foundation
import SwiftUI

struct Completed: Codable, Identifiable {
    var id = UUID()
    let image: Data
    let title: String
    let date: String
    
    init(id: UUID = UUID(), image: UIImage, title: String, date: String) {
        self.id = id
        self.image = image.pngData() ?? Data()
        self.title = title
        self.date = date
    }
}


class CollectionModel: ObservableObject {
    @Published var collection: [Completed] = []
    // 여기에 좋아요 필터링 함수 넣기
    
    func saveData() {
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("PhotoKitsm.json")
        if let data = try? JSONEncoder().encode(collection) {
            try? data.write(to: fileURL)
        }
    }
    
    func loadData() {
        let fileURL = getDocumentsDirectory().appendingPathComponent("PhotoKitsm.json")
        if let data = try? Data(contentsOf: fileURL) {
            if let decoded = try? JSONDecoder().decode([Completed].self, from: data) {
                self.collection = decoded
            }
        }
    }

    func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}

//extension Completed: RawRepresentable {
//    public init?(rawValue: String) {
//        guard let data = rawValue.data(using: .utf8),
//            let result = try? JSONDecoder().decode(Completed.self, from: data)
//        else {
//            return nil
//        }
//        self = result
//    }
//    
//    public var rawValue: String {
//        guard let data = try? JSONEncoder().encode(self),
//            let result = String(data: data, encoding: .utf8)
//        else {
//            return "[]"
//        }
//        return result
//    }
//}
//
//extension Array: RawRepresentable where Element: Codable {
//    public init?(rawValue: String) {
//        guard let data = rawValue.data(using: .utf8),
//              let result = try? JSONDecoder().decode([Element].self, from: data)
//        else {
//            return nil
//        }
//        self = result
//    }
//
//    public var rawValue: String {
//        guard let data = try? JSONEncoder().encode(self),
//              let result = String(data: data, encoding: .utf8)
//        else {
//            return "[]"
//        }
//        return result
//    }
//}
