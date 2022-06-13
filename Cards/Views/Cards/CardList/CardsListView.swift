//
//  CardsListView.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/8.
//

import SwiftUI

struct CardsListView: View {
  @EnvironmentObject var viewState: ViewState
  @EnvironmentObject var cardStore: CardStore
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack {
        ForEach(cardStore.cards) { card in
          CardThumbnailView(card: card)
            .onTapGesture {
              viewState.selectedCard = card
              viewState.showAllCards.toggle()
            }
            .contextMenu {
              Button(action: { cardStore.remove(card) }) {
                Label("删除", systemImage: "trash")
              }
            }
        }
      }
    }
  }
}

struct CardsListView_Previews: PreviewProvider {
  static var previews: some View {
    CardsListView()
      .environmentObject(ViewState())
      .environmentObject(CardStore(defaultData: true))
  }
}
