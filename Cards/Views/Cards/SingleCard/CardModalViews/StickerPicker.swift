//
//  StickerPicker.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/15.
//

import SwiftUI

struct StickerPicker: View {
  var body: some View {
    if let resourcePath = Bundle.main.resourcePath,
       let uiImage = UIImage(named: resourcePath + "/Stickers/Camping/fire.png") {
      Image(uiImage: uiImage)
    } else {
      EmptyView()
    }
  }
}

struct StickerPicker_Previews: PreviewProvider {
  static var previews: some View {
    StickerPicker()
  }
}
