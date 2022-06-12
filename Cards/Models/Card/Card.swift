//
//  Card.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/12.
//

import SwiftUI

struct Card: Identifiable {
  let id = UUID()
  var backgroundColor = Color.yellow
  var elements: [CardElement] = []
}
