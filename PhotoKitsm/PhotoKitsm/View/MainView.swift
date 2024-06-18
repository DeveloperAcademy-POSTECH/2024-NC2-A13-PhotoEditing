//
//  ContentView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/17/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("PhotoKitsm")
                        .font(.custom("Sintony-Bold.ttf", size: 36))
                        .fontWeight(.bold)
                    Spacer()
                    NavigationLink(destination: CreateView(),
                                   label: {
                        Image(systemName: "plus")
                            .font(.title)
                    })
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    MainView()
}
