//
//  PhotoPicker.swift
//  Cards
//
//  Created by shuo zhang on 2022/7/6.
//

import SwiftUI

struct PhotoPicker: UIViewRepresentable {
  func makeUIView(context: Context) -> UILabel {
    let label = UILabel()
    label.text = "我是个label"
    return label
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
  }
}

struct PhotoPicker_Previews: PreviewProvider {
  static var previews: some View {
//    Text("hello")
    PhotoPicker()
      .background(Color.yellow)
  }
}
