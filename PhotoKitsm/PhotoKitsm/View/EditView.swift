//
//  EditView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI

struct EditView: View {
    @State var imageToEdit = "samplePhoto"
    @Binding var showEditView: Bool

    var body: some View {
            VStack {
                HStack {
                    Button(action: {
                        showEditView = false
                    }) {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .padding()
                    Spacer()
                    Text("Edit")
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        showEditView = false
                    }) {
                        Text("Done")
                            .font(.system(size: 20))
                    }
                    .padding()
                }
                Divider()
                
                TabView {
                    VStack {
                        Image(imageToEdit)
                            .resizable()
                            .scaledToFit()
                    }
                    .tabItem {
                        Image(systemName: "crop")
                        Text("Crop")
                    }
                    VStack {
                        Image(imageToEdit)
                            .resizable()
                            .scaledToFit()
                    }
                    .tabItem {
                        Image(systemName: "camera.filters")
                        Text("Filter")
                    }
                    VStack {
                        Image(imageToEdit)
                            .resizable()
                            .scaledToFit()
                    }
                    .tabItem {
                        Image(systemName: "pencil.and.scribble")
                        Text("Draw")
                    }
                }
            }
        }
    }


#Preview {
    MainView()
}
