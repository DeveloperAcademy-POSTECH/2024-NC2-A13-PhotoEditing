//
//  PhotoEditingModel.swift
//  PhotoKitsm
//
//  Created by Lee Sihyeong on 6/18/24.
//

import Foundation
import PhotosUI
import SwiftUI

struct PhotoEditing: Identifiable {
    var id = UUID()
    var selectedPhoto: PhotosPickerItem?
    var originalImage: UIImage?
    var editedImage: UIImage?
    var showEditView: Bool = false
}
