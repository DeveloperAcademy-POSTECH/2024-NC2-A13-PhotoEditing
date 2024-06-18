//
//  ContentView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/17/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    // MARK: [issue] Bold 폰트를 사용했는데 화면에 적용이 안됨
                    Text("PhotoKitsm")
                        .font(.custom("Sintony-Bold", size: 36))
                    
                    Spacer()
                    NavigationLink(destination: CreateView(), label: {
                        Image(systemName: "plus")
                            .font(.title)
                    })
                }
                .padding()
                
                // MARK: [issue] Divider 의 공백을 좌우 다르게 주고 싶은데 방법 고민 중
                Divider()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        //최신순으로 정렬
                        HStack {
                            Text("Collection")
                                .font(.title)
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                //더미데이터 이용한 스크롤뷰 구현
                                ForEach(0..<10) { index in
                                    NavigationLink(destination: PhotoView()) {
                                        VStack(alignment: .leading) {
                                            Image("sampleFrameImage")
                                                .resizable()
                                                .scaledToFit()
                                            Text("인사이드아웃2 관람🍿")
                                                .font(.system(size: 13))
                                                .lineLimit(1)
                                            Text("2024.06.14")
                                                .font(.caption)
                                                .foregroundStyle(Color.gray)
                                        }
                                        .frame(width: 120)
                                    }
                                }
                                
                            }
                        }
                        Divider()
                        //좋아요&최신순으로 정렬
                        HStack {
                            Text("Favorite")
                                .font(.title)
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                //더미데이터 이용한 스크롤뷰 구현
                                ForEach(0..<10) { index in
                                    VStack(alignment: .leading) {
                                        Image("sampleFrameImage")
                                            .resizable()
                                            .scaledToFit()
                                        Text("인사이드아웃2 관람🍿")
                                            .font(.system(size: 13))
                                            .lineLimit(1)
                                        Text("2024.06.14")
                                            .font(.caption)
                                            .foregroundStyle(Color.gray)
                                    }
                                    .frame(width: 120)
                                }
                                
                            }
                        }
                        
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
