//
//  EditView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI

struct EditView: View {
    @State var imageToEdit = "samplePhoto"

    var body: some View {
            VStack {
                TabView {
                    VStack {
                        Image(imageToEdit)
                            .resizable()
                            .scaledToFit()
                    }
                    .tabItem {
                        Image(systemName: "crop")
                        Text("Crop")
                    }
                    VStack {
                        Image(imageToEdit)
                            .resizable()
                            .scaledToFit()
                    }
                    .tabItem {
                        Image(systemName: "camera.filters")
                        Text("Filter")
                    }
                    VStack {
                        Image(imageToEdit)
                            .resizable()
                            .scaledToFit()
                    }
                    .tabItem {
                        Image(systemName: "pencil.and.scribble")
                        Text("Draw")
                    }
                }
                
            }
            .navigationTitle("Edit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CreateView(), label: {
                        Text("done")
                    })
                }
            }
        }
    }


#Preview {
    EditView()
}
