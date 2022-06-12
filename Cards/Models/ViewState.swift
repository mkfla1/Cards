//
//  ViewState.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/8.
//

import SwiftUI

class ViewState: ObservableObject {
  @Published var showAllCards = true {
    didSet {
      if showAllCards { selectedCard = nil }
    }
  }
  var selectedCard: Card?
}
