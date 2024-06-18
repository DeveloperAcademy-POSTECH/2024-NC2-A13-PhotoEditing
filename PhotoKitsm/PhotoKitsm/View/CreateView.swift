//
//  CreateView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI

struct CreateView: View {
    var body: some View {
            VStack {
                Rectangle()
                    .frame(width: 393, height: 50)
                    .foregroundColor(.white)
                PhotoFrameView()
            }
            .navigationTitle("Create")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CompleteView(), label: {
                        Text("done")
                    })
                }
            }
        }
    
}

#Preview {
    CreateView()
}
