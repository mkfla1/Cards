//
//  CardBottomToolbar.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/8.
//

import SwiftUI

struct ToolbarButtonView: View {
  private let modalButton: [CardModal: (text: String, imageName: String)] = [
    .photoPicker: ("照片", "photo"),
    .framePicker: ("画框","square.on.circle"),
    .stickerPicker: ("贴纸", "heart.circle"),
    .textPicker: ("文字", "textformat")
  ]
  let cardModal: CardModal
  
  var body: some View {
    if let text = modalButton[cardModal]?.text,
       let imageName = modalButton[cardModal]?.imageName {
      VStack {
        Image(systemName: imageName)
          .font(.title)
        Text(text)
      }
      .padding(.top)
    }
  }
}

struct CardBottomToolbar: View {
  @Binding var cardModal: CardModal?
  
  var body: some View {
    HStack(alignment: .lastTextBaseline) {
      Button(action: { cardModal = .photoPicker }) {
        ToolbarButtonView(cardModal: .photoPicker)
      }
      Button(action: { cardModal = .framePicker }) {
        ToolbarButtonView(cardModal: .framePicker)
      }
      Button(action: { cardModal = .stickerPicker }) {
        ToolbarButtonView(cardModal: .stickerPicker)
      }
      Button(action: { cardModal = .textPicker }) {
        ToolbarButtonView(cardModal: .textPicker)
      }
    }
  }
}

struct CardBottomToolbar_Previews: PreviewProvider {
  static var previews: some View {
    CardBottomToolbar(cardModal: .constant(.stickerPicker))
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
