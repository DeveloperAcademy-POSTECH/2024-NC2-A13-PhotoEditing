//
//  PhotoEditingModel.swift
//  PhotoKitsm
//
//  Created by Lee Sihyeong on 6/18/24.
//

import Foundation
import PhotosUI
import SwiftUI

struct PhotoEditing {
    var selectedPhoto: PhotosPickerItem?
    var originalImage: UIImage?
    var editedImage: UIImage?
}

class PhotoEditingModel {
    var editingPhotos: [PhotoEditing] = [PhotoEditing(), PhotoEditing(), PhotoEditing()]
}
