//
//  PhotoFrameView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI
import PhotosUI

struct PhotoFrameView: View {
    @EnvironmentObject var photoEditingModel: PhotoEditingModel
    
    @State var selectedPhoto: PhotosPickerItem?
    @State var croppedImage: UIImage?
    @State var showPhotoPicker: Bool = false
    @Binding var showEditView: Bool
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 20)
            
            ZStack {
                PhotosPicker(selection: $photoEditingModel.editingPhotos0.selectedPhoto) {
                    if let image = photoEditingModel.editingPhotos0.editedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 319, height: 204)
                        
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
            }
            .onChange(of: photoEditingModel.editingPhotos0.selectedPhoto) { oldValue, newValue in
                if let newValue {
                    Task {
                        if let imageData = try? await newValue.loadTransferable(type: Data.self), let image = UIImage(data: imageData) {
                            await MainActor.run(body: {
                                photoEditingModel.editingPhotos0.editedImage = image
                            })
                        }
                    }
                }
            }
            
            ZStack {
                PhotosPicker(selection: $photoEditingModel.editingPhotos1.selectedPhoto) {
                    if let image = photoEditingModel.editingPhotos1.editedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 319, height: 204)
                        
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
            }
            .onChange(of: photoEditingModel.editingPhotos1.selectedPhoto) { oldValue, newValue in
                if let newValue {
                    Task {
                        if let imageData = try? await newValue.loadTransferable(type: Data.self), let image = UIImage(data: imageData) {
                            await MainActor.run(body: {
                                photoEditingModel.editingPhotos1.editedImage = image
                            })
                        }
                    }
                }
            }
            
            ZStack {
                PhotosPicker(selection: $photoEditingModel.editingPhotos2.selectedPhoto) {
                    if let image = photoEditingModel.editingPhotos2.editedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 319, height: 204)
                        
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
            }
            .onChange(of: photoEditingModel.editingPhotos2.selectedPhoto) { oldValue, newValue in
                if let newValue {
                    Task {
                        if let imageData = try? await newValue.loadTransferable(type: Data.self), let image = UIImage(data: imageData) {
                            await MainActor.run(body: {
                                photoEditingModel.editingPhotos2.editedImage = image
                            })
                        }
                    }
                }
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
        .environmentObject(PhotoEditingModel())
}
