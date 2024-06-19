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
    
    var photoDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 393, height: 750)
                .foregroundColor(.black)
            VStack {
                ForEach($editings) { $edit in
                    PhotosPicker(selection: $edit.selectedPhoto) {
                        if $edit.wrappedValue.editedImage != nil {
                            if let image = $edit.wrappedValue.editedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 319, height: 204)
                                    .scaledToFill()
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
                    VStack(alignment: .leading, spacing: 10) {
                        Text(photoDate)
                            .font(.custom("Sintony", size: 15))
                            .foregroundColor(.white)
                        Text("PhotoKitsm")
                            .padding(.bottom, 10)
                            .font(.custom("Sintony-Bold", size: 21))
                        .foregroundColor(.white)
                    }
                    Spacer()
                    Image("QRcode")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }
                .frame(width: 319, height: 65)
            }
        }
        .background(Color.black)
        .ignoresSafeArea(edges: [.bottom])
    }
}

#Preview {
    MainView()
        .environmentObject(CollectionModel())
}
