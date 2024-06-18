//
//  CreateView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI

struct CreateView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var showEditView: Bool = false
    @State var showCompleteView: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 393, height: 50)
                .foregroundColor(.white)
            PhotoFrameView(showEditView: $showEditView)
        }
        .navigationTitle("Create")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                // MARK: 여기서 done 누르면 프레임사진 하단에 날짜랑 QR 코드 추가해주어야 함
                Button {
                    showCompleteView.toggle()
                } label: {
                    Text("Done")
                }
            }
        }
        .fullScreenCover(isPresented: $showEditView, content: {
            EditView(showEditView: $showEditView)
        })
        .fullScreenCover(isPresented: $showCompleteView, content: {
            CompleteView(showCompleteView: $showCompleteView)
                .onDisappear {
                    dismiss()
                }
        })
    }
    
}

#Preview {
    MainView()
}
