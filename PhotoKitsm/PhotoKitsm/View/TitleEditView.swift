//
//  TitleEditView.swift
//  PhotoKitsm
//
//  Created by Lee Sihyeong on 8/30/24.
//

import SwiftUI

struct TitleEditView: View {
    @EnvironmentObject var model : CollectionModel
    @State var placeHolder: String = ""
    @State var renameTitle: String = ""
    @Binding var showTitleEditView: Bool
    @Binding var selectedPhoto: Completed
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            Text("Rename your photo!")
                .padding(10)
            
            Image(uiImage: UIImage(data: selectedPhoto.image)!)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            
            TextField(
                placeHolder,
                text: $renameTitle
            )
            .frame(width: 200)
            .focused($isFocused)
            .padding(10)
            
            Spacer()
        }
        .onAppear {
            UITextField.appearance().clearButtonMode = .whileEditing
            placeHolder = selectedPhoto.title
            renameTitle = selectedPhoto.title
            isFocused = true
        }
        .navigationTitle("Edit title")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    showTitleEditView = false
                } label: {
                    Image(systemName: "xmark")
                        .font(.subheadline)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    selectedPhoto.title = renameTitle
                    showTitleEditView = false
                    model.saveData()
                } label: {
                    Text("save")
                        .font(.title3)
                }
                .disabled(selectedPhoto.title.isEmpty)
            }
        }
    }
}

#Preview {
    NavigationStack {
        TitleEditView(showTitleEditView: .constant(true), selectedPhoto: .constant(.init(image: .init(), title: "", date: "")))
    }
}
