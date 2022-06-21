//
//  StickerPicker.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/15.
//

import SwiftUI

struct StickerPicker: View {
  @Environment(\.presentationMode) var presentationMode
  @State private var stickerNames: [String] = []
  @Binding var stickerImage: UIImage?
  
  let columns = [
    GridItem(.adaptive(minimum: 120), spacing: 10)
  ]
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns) {
        ForEach(stickerNames, id: \.self) { path in
          Image(uiImage: image(from: path))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onTapGesture {
              stickerImage = image(from: path)
              presentationMode.wrappedValue.dismiss()
            }
        }
      }
    }
    .onAppear {
      stickerNames = loadStickers()
    }
  }
  
  func loadStickers() -> [String] {
    var themes: [URL] = []
    var stickerNames: [String] = []
    
    let fileManager = FileManager.default
    if let resourcePath = Bundle.main.resourcePath,
       let enumerator = fileManager.enumerator(
        at: URL(fileURLWithPath: resourcePath + "/Stickers"), includingPropertiesForKeys: nil,
        options: [
          .skipsHiddenFiles,
          .skipsSubdirectoryDescendants
        ])
    {
      for case let url as URL in enumerator {
        if url.hasDirectoryPath {
          themes.append(url)
        }
      }
    }
    
    for theme in themes {
      if let files = try? fileManager.contentsOfDirectory(atPath: theme.path) {
        for file in files {
          stickerNames.append(theme.path + "/" + file)
        }
      }
    }
    
    return stickerNames
  }
  
  func image(from path: String) -> UIImage {
    print("loading:", path)
    return UIImage(named: path)
      ?? UIImage(named: "error-image")
      ?? UIImage()
  }
}

struct StickerPicker_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      StickerPicker(stickerImage: .constant(UIImage()))
    }
  }
}
