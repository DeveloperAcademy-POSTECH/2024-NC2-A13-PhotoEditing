//
//  PhotoKitsmApp.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/17/24.
//

import SwiftUI

@main
struct PhotoSetApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(CollectionModel())
        }
    }
}
