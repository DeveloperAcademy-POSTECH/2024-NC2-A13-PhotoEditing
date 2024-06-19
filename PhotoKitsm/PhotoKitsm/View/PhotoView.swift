//
//  PhotoView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI

struct PhotoView: View {
    @EnvironmentObject var model: CollectionModel
    @Binding var photoToShow: Completed
    @State var isLiked: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 393, height: 100)
                .foregroundColor(.white)
            if let image = UIImage(data:photoToShow.image) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 393)
            }
        }
        .background(.black)
        .navigationTitle("\(photoToShow.title)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isLiked.toggle()
                    photoToShow.favorite = isLiked
                    print("여기\(photoToShow.favorite)")
                    model.saveData()
                } label: {
                    if isLiked {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                    } else {
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            //MARK: 추가 구현 예정 기능 (공유)
//            ToolbarItem(placement: .topBarTrailing) {
//                Button {
//                    // 공유 로직 여기로
//                } label: {
//                    Image(systemName: "square.and.arrow.up")
//                }
//            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // 카메라 앨범에 저장 로직 여기로
                } label: {
                    Image(systemName: "square.and.arrow.down")
                }
            }
        }
        .onAppear {
            isLiked = photoToShow.favorite
        }
        .ignoresSafeArea(edges: [.top, .bottom])
    }
}
