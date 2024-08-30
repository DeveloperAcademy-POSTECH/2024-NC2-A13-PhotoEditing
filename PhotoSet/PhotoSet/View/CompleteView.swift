//
//  CompleteView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI

struct CompleteView: View {
    @EnvironmentObject var model : CollectionModel
    @State var photoTitle: String = ""
    @Binding var showCompleteView: Bool
    @Binding var completedImage: UIImage?
    @FocusState private var isFocused: Bool
    
    var photoDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: Date())
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            Text("Your Photo is ready!")
                .padding(10)
            
            Image(uiImage: completedImage!)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            
            TextField(
                "Title",
                text: $photoTitle
            )
            .frame(width: 200)
            .focused($isFocused)
            .padding(10)
            
            Spacer()
        }
        .onAppear {
            UITextField.appearance().clearButtonMode = .whileEditing
            isFocused = true
        }
        .navigationTitle("Complete")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    showCompleteView = false
                } label: {
                    Image(systemName: "xmark")
                        .font(.subheadline)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    if let completedImage {
                        model.collection.insert(Completed(image: completedImage, title: photoTitle, date: photoDate), at: 0)
                        model.saveData()
                    }
                    showCompleteView = false
                } label: {
                    Text("save")
                        .font(.title3)
                }
                .disabled(photoTitle.isEmpty)
            }
        }
    }
}

#Preview {
    NavigationStack {
        CompleteView(showCompleteView: .constant(true), completedImage: .constant(.init()))
    }
}
