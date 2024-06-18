//
//  PhotoFrameView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI

struct PhotoFrameView: View {
    @State var isAddingPhoto: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 20)
            
            ForEach(0..<3) { index in
                ZStack {
                    Rectangle()
                        .frame(width: 319, height: 204)
                        .foregroundColor(.white)
                    Image(systemName: "photo.badge.plus")
                        .font(.system(size: 33))
                }
                .onTapGesture {
                    isAddingPhoto = true
                }
            }

            HStack {
                Text("PhotoKitsm")
                    .font(.custom("Sintony-Bold", size: 21))
                    .foregroundColor(.white)
                Spacer()
                
                //MARK: flow 확인용 임시 버튼
                NavigationLink(destination: EditView(), label: {
                    Image(systemName: "chevron.right")
                        .font(.title)
                        .foregroundColor(.blue)
                })

            }
            .frame(width: 319, height: 91)
        }
        .background(Color.black)
        .ignoresSafeArea(edges: [.bottom])
        .sheet(isPresented: $isAddingPhoto) {
            PhotoPicker()
        }
    }
}

#Preview {
    PhotoFrameView()
}
