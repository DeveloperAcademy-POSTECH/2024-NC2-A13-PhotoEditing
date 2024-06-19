//
//  ContentView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/17/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var model: CollectionModel
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("PhotoKitsm")
                        .font(.custom("Sintony-Bold", size: 36))
                    
                    Spacer()
                    NavigationLink(destination: CreateView(), label: {
                        Image(systemName: "plus")
                            .font(.title)
                    })
                }
                .padding()
                
                Divider()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        // 최신순으로 정렬
                        HStack {
                            Text("Collection")
                                .font(.title)
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach($model.collection) { $item in
                                    NavigationLink(destination: PhotoView(photoToShow: $item)) {
                                        VStack(alignment: .leading) {
                                            if let image = UIImage(data: item.image) {
                                                Image(uiImage: image)
                                                    .resizable()
                                                    .scaledToFit()
                                            } else {
                                                Text("no image")
                                            }
                                                Text("\(item.title)")
                                                    .font(.system(size: 13))
                                                    .lineLimit(1)
                                                Text("\(item.date)")
                                                    .font(.caption)
                                                    .foregroundStyle(Color.gray)
                                        }
                                        .frame(width: 120)
                                    }
                                }
                            }
                        }
                        Divider()
                        // 좋아요&최신순으로 정렬
                        HStack {
                            Text("Favorite")
                                .font(.title)
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach($model.collection.filter { $0.wrappedValue.favorite }) { $item in
                                    NavigationLink(destination: PhotoView(photoToShow: $item)) {
                                        VStack(alignment: .leading) {
                                            if let image = UIImage(data: item.image) {
                                                Image(uiImage: image)
                                                    .resizable()
                                                    .scaledToFit()
                                            } else {
                                                Text("no image")
                                            }
                                                Text("\(item.title)")
                                                    .font(.system(size: 13))
                                                    .lineLimit(1)
                                                Text("\(item.date)")
                                                    .font(.caption)
                                                    .foregroundStyle(Color.gray)
                                        }
                                        .frame(width: 120)
                                    }
                                }
                            }
                        }
                        
                    }
                    .padding()
                }
            }
            .onAppear {
                model.loadData()
                print(model.collection)
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(CollectionModel())
}
