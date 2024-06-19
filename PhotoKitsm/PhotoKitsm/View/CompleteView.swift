//
//  CompleteView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI

struct CompleteView: View {
    @State var photoName: String = ""
    @Binding var showCompleteView: Bool
    
    var body: some View {
        VStack {
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
                    showCompleteView = false
                }) {
                    Text("save")
                        .font(.system(size: 20))
                }
                .padding()
            }
            Divider()
            
            Text("Your Photo is ready!")

            Image("sampleFrameImage")
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
        .environmentObject(PhotoEditingModel())
}
