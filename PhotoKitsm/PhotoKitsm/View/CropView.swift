//
//  CropView.swift
//  PhotoKitsm
//
//  Created by Lee Sihyeong on 6/20/24.
//

import SwiftUI

struct CropView: View {
    @Binding var showEditView: Bool
    @Binding var editingPhoto: PhotoEditing
    
    @State private var hideGrids: Bool = false
    @State private var scale: CGFloat = 1
    @State private var lastScale: CGFloat = 0
    @State private var offset: CGSize = .zero
    @State private var lastStoredOffset: CGSize = .zero
    @GestureState private var isInteracting: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundStyle(.black)
                    .ignoresSafeArea()
                ImageView()
                    .navigationTitle("Crop")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button(action: {
                                showEditView = false
                            }) {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        }
                        
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                                let renderer = ImageRenderer(content: ImageView(true))
                                if let image = renderer.uiImage {
                                    editingPhoto.editedImage = image
                                }
                                showEditView = false
                            }) {
                                Text("Done")
                                    .font(.system(size: 20))
                            }
                        }
                    }
                
                
                VStack {
                    Rectangle()
                        .foregroundStyle(.white)
                        .frame(height: 100)
                        .ignoresSafeArea()
                    Spacer()
                }
            }
        }
    }
    
    @ViewBuilder
    func ImageView(_ hideGrids: Bool = false) -> some View {
        GeometryReader {
            let size = $0.size
            if let image = editingPhoto.originalImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(content: {
                        GeometryReader { proxy in
                            let rect = proxy.frame(in: .named("CROPVIEW"))
                            Color.clear
                                .onChange(of: isInteracting) {
                                    // true : Dragging
                                    // false : Stopped Dragging
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        if rect.minX > 0 {
                                            // resetting to last location
                                            offset.width = (offset.width - rect.minX)
                                        }
                                        if rect.minY > 0 {
                                            // resetting to last location
                                            offset.height = (offset.height - rect.minY)
                                        }
                                        if rect.maxX < size.width {
                                            offset.width = (rect.minX - offset.width)
                                        }
                                        if rect.maxY < size.height {
                                            offset.height = (rect.minY - offset.height)
                                        }
                                    }
                                    if !isInteracting {
                                        lastStoredOffset = offset
                                    }
                                }
                        }
                    })
                    .frame(width: 319, height: 204)
            }
        }
        .scaleEffect(scale)
        .offset(offset)
        .overlay(content: {
            if !hideGrids {
                Grids()
            }
        })
        .coordinateSpace(name: "CROPVIEW")
        .gesture(
            DragGesture()
                .updating($isInteracting, body: {_, out, _ in out = true})
                .onChanged({ value in
                    let translation = value.translation
                    offset = CGSize(
                        width: translation.width + lastStoredOffset.width,
                        height: translation.height + lastStoredOffset.height)
                })
        )
        .gesture(
            MagnificationGesture()
                .updating($isInteracting, body: { _, out, _ in
                    out = true
                })
                .onChanged({ value in
                    let updatedScale = value + lastScale
                    // Limiting Beyond 1
                    scale = (updatedScale < 1 ? 1 : updatedScale)
                })
                .onEnded({ value in
                    withAnimation(.easeInOut(duration: 0.2)) {
                        if scale < 1 {
                            scale = 1
                            lastScale = 0
                        } else {
                            lastScale = scale - 1
                        }
                    }
                    
                })
        )
        .frame(width: 319, height: 204)
    }
    
    @ViewBuilder
    func Grids() -> some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(width: 319, height: 204)
                .border(.white, width: 1)
            HStack {
                Spacer()
                    .frame(width: 50)
                Rectangle()
                    .fill(.white.opacity(0.5))
                    .frame(width: 1)
                    .frame(maxWidth: .infinity)
                Rectangle()
                    .fill(.white.opacity(0.5))
                    .frame(width: 1)
                    .frame(maxWidth: .infinity)
                Spacer()
                    .frame(width: 50)
            }
            .frame(width: 319, height: 204)
            VStack {
                Spacer()
                    .frame(height: 35)
                Rectangle()
                    .fill(.white.opacity(0.5))
                    .frame(height: 1)
                    .frame(maxHeight: .infinity)
                Rectangle()
                    .fill(.white.opacity(0.5))
                    .frame(height: 1)
                    .frame(maxHeight: .infinity)
                Spacer()
                    .frame(height: 35)
            }
            .frame(width: 319, height: 204)
        }
        
    }
}


//
//#Preview {
//    CropView()
//}
