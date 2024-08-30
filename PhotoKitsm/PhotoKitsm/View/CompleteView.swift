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
        VStack {
            //MARK: navigation bar로 바꿀 수 있음 (시간나면 합시다)
            HStack {
                Button(action: {
                    showCompleteView = false
                }) {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .padding()
                Spacer()
                Text("Complete")
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    if let completedImage {
                        model.collection.insert(Completed(image: completedImage, title: photoTitle, date: photoDate), at: 0)
                        model.saveData()
                        print("model insert executed")
                        print(model.collection)

                    }
                    showCompleteView = false
                }) {
                    Text("save")
                        .font(.system(size: 20))
                }
                .disabled(photoTitle.isEmpty)
                .padding()
            }
            Divider()
            
            Text("Your Photo is ready!")

            Image(uiImage: completedImage!)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            
            TextField(
                "Insert Title",
                text: $photoTitle
            )
            .frame(width: 200)
            .focused($isFocused)
            Spacer()
        }
        .onAppear {
            isFocused = true
        }
    }
}

#Preview {
    MainView()
}
