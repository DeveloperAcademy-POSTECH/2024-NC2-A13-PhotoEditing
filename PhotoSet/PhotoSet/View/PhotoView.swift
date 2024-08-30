//
//  PhotoView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI
import Photos

struct PhotoView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var model: CollectionModel
    @Binding var photoToShow: Completed
    @State private var isLiked: Bool = false
    @State private var isSaved: Bool = false
    @State private var isDeleted: Bool = false
    @State private var isDenied: Bool = false
    @State private var showTitleEditView: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 393, height: 100)
                .foregroundColor(.white)
            if let image = UIImage(data:photoToShow.image) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 393)
            }
        }
        .background(.black)
        .navigationTitle("\(photoToShow.title)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isLiked.toggle()
                    photoToShow.favorite = isLiked
                    model.saveData()
                } label: {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .font(.title3)
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Button {
                        showTitleEditView = true
                    } label: {
                        Label("Edit title", systemImage: "pencil")
                    }
                    
                    Button {
                        if let image = UIImage(data:photoToShow.image) {
                            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        }
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                            if PHPhotoLibrary.authorizationStatus(for: .addOnly) == .denied {
                                isDenied.toggle()
                            } else {
                                isSaved.toggle()
                            }
                        }
                    } label: {
                        Label("Save to album", systemImage: "square.and.arrow.down")
                    }
                    
                    Button(role: .destructive) {
                        isDeleted = true
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .padding(.vertical, 10)
                        .font(.title3)
                }
            }
        }
        .onAppear {
            isLiked = photoToShow.favorite
        }
        .fullScreenCover(isPresented: $showTitleEditView, content: {
            NavigationStack {
                TitleEditView(showTitleEditView: $showTitleEditView, selectedPhoto: $photoToShow)
            }
        })
        .alert("Saved", isPresented: $isSaved, actions: {
            Button {
                isSaved = false
            } label: {
                Text("OK")
            }
        }, message: {
            Text("photo is saved")
        })
        .alert("Denied", isPresented: $isDenied, actions: {
            Button {
                isDenied = false
            } label: {
                Text("OK")
            }
            
        }, message: {
            Text("please authrize in settings app")
        })
        .alert("Delete this photo?", isPresented: $isDeleted, actions: {
            Button(role: .destructive) {
                model.collection.removeAll { item in
                    item.id == photoToShow.id }
                model.saveData()
                dismiss()
            } label: {
                Text("Delete")
            }
        })
        .ignoresSafeArea(edges: [.top, .bottom])
    }
}

#Preview {
    NavigationStack {
        PhotoView(photoToShow: .constant(.init(image: .init(), title: "Asdf", date: "asdf")))
            .environmentObject(CollectionModel())
    }
}
