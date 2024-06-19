//
//  CreateView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI
import PhotosUI

struct CreateView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var showCompleteView: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 393, height: 50)
                .foregroundColor(.white)
            PhotoFrameView()
        }
        .navigationTitle("Create")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showCompleteView) {
            CompleteView(showCompleteView: $showCompleteView)
                .onDisappear {
                    dismiss()
                }
        }
        //        .toolbar {
        //            ToolbarItem(placement: .topBarTrailing) {
        //                // MARK: 여기서 done 누르면 프레임사진 하단에 날짜랑 QR 코드 추가해주어야 함
        //                if photoEditingModel.editingPhotos0.editedImage == nil || photoEditingModel.editingPhotos1.editedImage == nil || photoEditingModel.editingPhotos2.editedImage == nil {
        //                    Text("Done")
        //                        .foregroundStyle(.gray)
        //                } else {
        //                    Button {
        //                        //                        let renderer = ImageRenderer(content: PhotoFrameView( showEditView: .constant(false)))
        //                        //                        if let image = renderer.uiImage {
        //                        //                            collectionModel.collection.append(Completed(image: image, title: "제목", date: "2024"))
        //                        //                        }
        //                        showCompleteView.toggle()
        //                    } label: {
        //                        Text("Done")
        //                    }
        //                }
        //            }
        //        }
    }
    
}

#Preview {
    MainView()
}
