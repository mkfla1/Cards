//
//  SingleCardView.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/8.
//

import SwiftUI

struct SingleCardView: View {
  @EnvironmentObject var viewState: ViewState
  @EnvironmentObject var cardStore: CardStore
  
  var body: some View {
    if let selectedCard = viewState.selectedCard,
       let index = cardStore.index(card: selectedCard) {
      NavigationView {
        CardDetailView(card: $cardStore.cards[index])
          .navigationBarTitleDisplayMode(.inline)
      }
      .navigationViewStyle(.stack)
    }
  }
}

struct SingleCardView_Previews: PreviewProvider {
  static var previews: some View {
    SingleCardView()
      .environmentObject(ViewState(card: initialCards[0]))
      .environmentObject(CardStore(defaultData: true))
  }
}
