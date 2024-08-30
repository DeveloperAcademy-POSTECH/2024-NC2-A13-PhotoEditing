//
//  EditView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI

struct EditView: View {
    
    @Binding var showEditView: Bool
    @Binding var editingPhoto: PhotoEditing

    var body: some View {
        NavigationStack {
            VStack {
                TabView {
                    CropView(showEditView: $showEditView, editingPhoto: $editingPhoto)
                    .tabItem {
                        Image(systemName: "crop")
                        Text("Crop")
                    }
                    //MARK: 추가 구현 예정 기능 (filter, pencil)
//                    VStack {
//                        Image(imageToEdit)
//                            .resizable()
//                            .scaledToFit()
//                    }
//                    .tabItem {
//                        Image(systemName: "camera.filters")
//                        Text("Filter")
//                    }
//                    VStack {
//                        Image(imageToEdit)
//                            .resizable()
//                            .scaledToFit()
//                    }
//                    .tabItem {
//                        Image(systemName: "pencil.and.scribble")
//                        Text("Draw")
//                    }
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
                            .font(.subheadline)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        if let image = editingPhoto.originalImage {
                            // MARK: 여기서 이미지 크기 지정 해야 할듯
                            
                            editingPhoto.editedImage = image
                        }
                        showEditView = false
                    }) {
                        Text("Done")
                            .font(.title3)
                    }
                }
            }
        }
    }
}


#Preview {
    MainView()
}
