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
  
  mutating func remove(_ element: CardElement) {
    if let index = element.index(in: elements) {
      elements.remove(at: index)
    }
  }
  
  mutating func addElement(uiImage: UIImage) {
    let element = ImageElement(image: Image(uiImage: uiImage))
    elements.append(element)
  }
}
