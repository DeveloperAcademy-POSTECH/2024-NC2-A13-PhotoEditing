//
//  PhotoView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI

struct PhotoView: View {
    var body: some View {
        VStack {
            Image("sampleFrameImage")
                .resizable()
                .scaledToFit()
                .frame(width: 393)
        }
        .navigationTitle("인사이드아웃2 관람🍿")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // 즐겨찾기 로직 여기로
                } label: {
                    Image(systemName: "heart")
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    // 공유 로직 여기로
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .ignoresSafeArea(edges: [.bottom])
    }
}

#Preview {
    PhotoView()
}
