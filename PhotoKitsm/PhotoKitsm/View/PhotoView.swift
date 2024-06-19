//
//  PhotoView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI

struct PhotoView: View {
    @State var isLiked: Bool = false
    
    var body: some View {
        VStack {
            Image("sampleFrameImage")
                .resizable()
                .scaledToFit()
                .frame(width: 394)
        }
        .navigationTitle("인사이드아웃2 관람🍿")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isLiked.toggle()
                    // 즐겨찾기 로직 여기로
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
        .ignoresSafeArea(edges: [.bottom])
    }
}

#Preview {
    PhotoView()
        .environmentObject(PhotoEditingModel())
}
