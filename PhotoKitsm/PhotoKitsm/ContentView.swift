//
//  ContentView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "photo")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("PhotoKitsm-is-here")
            Text("Branch added!")
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
