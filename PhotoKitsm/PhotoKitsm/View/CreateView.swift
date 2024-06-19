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
    @EnvironmentObject var model: CollectionModel
    
    @State var showCompleteView: Bool = false
    @State var completedImage: UIImage? = nil
    
    @State var editings: [PhotoEditing] = [
        .init(),
        .init(),
        .init()
    ]
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 393, height: 50)
                .foregroundColor(.white)
            PhotoFrameView(editings: $editings)
        }
        .navigationTitle("Create")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showCompleteView) {
            CompleteView(showCompleteView: $showCompleteView, completedImage: $completedImage)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if editings[0].editedImage == nil || editings[1].editedImage == nil || editings[2].editedImage == nil {
                    Text("Done")
                        .foregroundStyle(.gray)
                } else {
                    Button {
                        let renderer = ImageRenderer(content: PhotoFrameView(editings: $editings))
                        if let image = renderer.uiImage {
                            completedImage = image
                        }
                        model.saveData()
                        showCompleteView.toggle()
                    } label: {
                        Text("Done")
                    }
                }
            }
        }
        .onChange(of: model.collection.count) {
            dismiss()
        }
    }
    
}

#Preview {
    MainView()
        .environmentObject(CollectionModel())
}
