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
                .frame(width: 393, height: 90)
                .foregroundColor(.white)
            PhotoFrameView(editings: $editings)
        }
        .ignoresSafeArea()
        .navigationTitle("Create")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showCompleteView) {
            NavigationStack {
                CompleteView(showCompleteView: $showCompleteView, completedImage: $completedImage)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                
                Button {
                    let renderer = ImageRenderer(content: PhotoFrameView(editings: $editings))
                    renderer.scale = 3
                    if let image = renderer.uiImage {
                        completedImage = image
                    }
                    model.saveData()
                    showCompleteView.toggle()
                } label: {
                    Text("Done")
                }
                .disabled(editings[0].editedImage == nil || editings[1].editedImage == nil || editings[2].editedImage == nil)
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
