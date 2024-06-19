//
//  EditView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI

struct EditView: View {
    @EnvironmentObject var photoEditingModel: PhotoEditingModel
    
    @State var imageToEdit = "samplePhoto"
    @Binding var showEditView: Bool

    var body: some View {
        NavigationStack {
            VStack {
                TabView {
                    VStack {
                        if let image = photoEditingModel.editingPhotos0.originalImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                        }
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
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showEditView = false
                    }) {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        if let image = photoEditingModel.editingPhotos0.originalImage {
                            photoEditingModel.editingPhotos0.editedImage = image
                        }
                        showEditView = false
                    }) {
                        Text("Done")
                            .font(.system(size: 20))
                    }
                }
            }
        }
    }
}


#Preview {
    MainView()
        .environmentObject(PhotoEditingModel())
}
