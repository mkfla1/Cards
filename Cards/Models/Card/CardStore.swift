//
//  CardStore.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/12.
//

import SwiftUI

class CardStore: ObservableObject {
  @Published var cards: [Card] = []
}
