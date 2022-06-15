//
//  CardDetailView.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/8.
//

import SwiftUI

struct CardDetailView: View {
  @EnvironmentObject var viewState: ViewState
  @State private var cardModal: CardModal?
  @Binding var card: Card
  
  var content: some View {
    ZStack {
      card.backgroundColor
        .edgesIgnoringSafeArea(.all)
      ForEach(card.elements, id: \.id) { element in
        CardElementView(element: element)
          .contextMenu {
            Button(action: { card.remove(element)}) {
              Label("删除", systemImage: "trash")
            }
          }
          .resizableView(transform: bindingTransform(for: element))
          .frame(width: element.transform.size.width,
                 height: element.transform.size.height)
      }
    }
  }
  
  var body: some View {
    content
      .modifier(CardToolBar(cardModal: $cardModal))
      .sheet(item: $cardModal) { item in
        switch item {
        case .stickerPicker:
          StickerPicker()
        default:
          EmptyView()
        }
      }
  }
  
  func bindingTransform(for element: CardElement) -> Binding<Transform> {
    guard let index = element.index(in: card.elements) else {
      fatalError("不存在的element")
    }
    return $card.elements[index].transform
  }
}

struct CardDetailView_Previews: PreviewProvider {
  struct CardDetailPreview: View {
    @State private var card = initialCards[0]
    var body: some View {
      CardDetailView(card: $card)
        .environmentObject(ViewState(card: card))
    }
  }
  
  static var previews: some View {
    CardDetailPreview()
  }
}
