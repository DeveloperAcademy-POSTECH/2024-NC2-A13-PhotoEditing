//
//  CompleteView.swift
//  PhotoKitsm
//
//  Created by Kyuhee hong on 6/18/24.
//

import SwiftUI

struct CompleteView: View {
    @State var photoName: String = ""
    
    var body: some View {
        VStack {
            Image("sampleFrameImage")
                .resizable()
                .scaledToFit()
                .frame(width: 200)

            //MARK: 키보드 고정하는것이 가능한지 알아봐야 함
            TextField(
                    "Insert Title",
                    text: $photoName
                )
                .frame(width: 200)
                .onSubmit {
                    
                }
        }
        .navigationTitle("Complete")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: MainView(), label: {
                    Text("save")
                        .fontWeight(.bold)
                })
            }
        }
    }
}

#Preview {
    CompleteView()
}
