//
//  PhotoFrameView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI
import PhotosUI

struct PhotoFrameView: View {
    
    @Binding var editings: [PhotoEditing]
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 20)
            
            ForEach($editings) { $edit in
                PhotosPicker(selection: $edit.selectedPhoto) {
                    if $edit.wrappedValue.editedImage != nil {
                        if let image = $edit.wrappedValue.editedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 319, height: 204)
                        }
                    } else {
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 319, height: 204)
                                .foregroundColor(.white)
                            Image(systemName: "photo.badge.plus")
                                .font(.system(size: 33))
                            
                        }
                    }
                }
                .onChange(of: $edit.wrappedValue.selectedPhoto) {
                    if let newValue = $edit.wrappedValue.selectedPhoto {
                        Task {
                            if let imageData = try? await newValue.loadTransferable(type: Data.self), let image = UIImage(data: imageData) {
                                await MainActor.run(body: {
                                    $edit.wrappedValue.originalImage = image
                                    $edit.wrappedValue.showEditView.toggle()
                                })
                            }
                        }
                    }
                }
                .fullScreenCover(isPresented: $edit.showEditView, content: {
                    EditView(showEditView: $edit.showEditView, editingPhoto: $edit)
                })
            }
            HStack {
                Text("PhotoKitsm")
                    .font(.custom("Sintony-Bold", size: 21))
                    .foregroundColor(.white)
                Spacer()
            }
            .frame(width: 319, height: 91)
        }
        .background(Color.black)
        .ignoresSafeArea(edges: [.bottom])
    }
}

#Preview {
    MainView()
        .environmentObject(CollectionModel())
}
