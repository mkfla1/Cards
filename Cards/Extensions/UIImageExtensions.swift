//
//  UIImageExtensions.swift
//  Cards
//
//  Created by shuo zhang on 2022/7/25.
//

import UIKit

// MARK: - Save, load, delete Image file
extension UIImage {
  static var minSize = CGSize(width: 300, height: 200)
  static var maxSize = CGSize(width: 1000, height: 1500)
  
  func save(to filename: String? = nil) -> String {
    let image = resizeLargeImage()
    let path: String
    
    if let filename = filename {
      path = filename
    } else {
      path = UUID().uuidString
    }
    
    if let url = FileManager.documentURL?.appendingPathComponent(path) {
      do {
        try image.pngData()?.write(to: url)
      } catch {
        print(error.localizedDescription)
      }
    }
    return path
  }
  
  static func load(uuidString: String) -> UIImage? {
    guard uuidString != "none" else { return nil }
    if let url = FileManager.documentURL?.appendingPathComponent(uuidString),
       let imageData = try? Data(contentsOf: url) {
      return UIImage(data: imageData)
    }
    return nil
  }
  
  static func remove(name: String?) {
    if let name = name,
       let url = FileManager.documentURL?.appendingPathComponent(name) {
      try? FileManager.default.removeItem(at: url)
    }
  }
}

// MARK: - Resize Image
extension UIImage {
  func resizeLargeImage() -> UIImage {
    let defaultSize: CGFloat = 1000
    if size.width <= defaultSize || size.height <= defaultSize { return self }
    
    let scale: CGFloat
    if size.width >= size.height {
      scale = defaultSize / size.width
    } else {
      scale = defaultSize / size.height
    }
    let newSize = CGSize(
      width: size.width * scale,
      height: size.height * scale
    )
    return resize(to: newSize)
  }
  
  func resize(to size: CGSize) -> UIImage {
    let format = UIGraphicsImageRendererFormat()
    format.scale = 1
    return UIGraphicsImageRenderer(size: size, format: format)
      .image { _ in
        draw(in: CGRect(origin: .zero, size: size))
      }
  }
}
