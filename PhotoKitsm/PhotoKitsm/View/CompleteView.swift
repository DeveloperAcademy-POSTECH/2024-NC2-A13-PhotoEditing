//
//  CompleteView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI

struct CompleteView: View {
    @EnvironmentObject var model : CollectionModel
    @State var photoName: String = ""
    @Binding var showCompleteView: Bool
    @Binding var completedImage: UIImage?
    
    var body: some View {
        VStack {
            // navigation bar로 바꿀 수 있음
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
                        model.collection.insert(Completed(image: completedImage, title: "asdf", date: "date"), at: 0)
                    }
                    showCompleteView = false
                }) {
                    Text("save")
                        .font(.system(size: 20))
                }
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
                text: $photoName
            )
            .frame(width: 200)
            .onSubmit {
                
            }
            Spacer()
        }
    }
}

#Preview {
    MainView()
}
