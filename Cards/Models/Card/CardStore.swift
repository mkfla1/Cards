//
//  CardStore.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/12.
//

import SwiftUI

class CardStore: ObservableObject {
  @Published var cards: [Card] = []
  
  init(defaultData: Bool = false) {
    if defaultData {
      cards = initialCards
    }
  }
  
  func index(card: Card) -> Int? {
    cards.firstIndex { $0.id == card.id }
  }
}
