//
//  CardThumbnailView.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/8.
//

import SwiftUI

struct CardThumbnailView: View {
  let card: Card
  
  var body: some View {
    RoundedRectangle(cornerRadius: 15)
      .foregroundColor(card.backgroundColor)
      .frame(width: Settings.thumbnailSize.width, height: Settings.thumbnailSize.height)
  }
}

struct CardThumbnailView_Previews: PreviewProvider {
  static var previews: some View {
    CardThumbnailView(card: initialCards[0])
  }
}
