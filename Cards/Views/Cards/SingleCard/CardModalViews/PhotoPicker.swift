//
//  PhotoPicker.swift
//  Cards
//
//  Created by shuo zhang on 2022/7/6.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
  @Binding var images: [UIImage]
  
  func makeUIViewController(context: Context) -> some UIViewController {
    var config = PHPickerConfiguration()
    config.filter = .images
    config.selectionLimit = 0
    
    let picker = PHPickerViewController(configuration: config)
    picker.delegate = context.coordinator
    return picker
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
  }
  
  func makeCoordinator() -> PhotosCoordinator {
    PhotosCoordinator(parent: self)
  }
  
  class PhotosCoordinator: NSObject, PHPickerViewControllerDelegate {
    var parent: PhotoPicker
    init(parent: PhotoPicker) {
      self.parent = parent
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
      
    }
  }
}

struct PhotoPicker_Previews: PreviewProvider {
  static var previews: some View {
//    Text("hello")
    PhotoPicker(images: .constant([UIImage]()))
      .background(Color.yellow)
  }
}
