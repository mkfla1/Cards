//
//  Card.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/12.
//

import SwiftUI

struct Card: Identifiable {
  var id = UUID()
  var backgroundColor = Color.yellow
  var elements: [CardElement] = []
  
  mutating func remove(_ element: CardElement) {
    if let element = element as? ImageElement {
      UIImage.remove(name: element.imageFilename)
    }
    
    if let index = element.index(in: elements) {
      elements.remove(at: index)
    }
  }
  
  mutating func addElement(uiImage: UIImage) {
    let imageFilename = uiImage.save()
    let element = ImageElement(
      image: Image(uiImage: uiImage),
      imageFilename: imageFilename)
    elements.append(element)
  }
  
  mutating func update(_ element: CardElement?, frame: AnyShape) {
    if let element = element as? ImageElement,
       let index = element.index(in: elements) {
      var newElement = element
      newElement.frame = frame
      elements[index] = newElement
    }
  }
  
  func save() {
    print("Saving data")
  }
}

extension Card: Codable {
  enum CodingKeys: CodingKey {
    case id, backgroundColor, imageElements, textElements
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let id = try container.decode(String.self, forKey: .id)
    self.id = UUID(uuidString: id) ?? UUID()
    
    elements += try container.decode([ImageElement].self, forKey: .imageElements)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id.uuidString, forKey: .id)
    
    let imageElements = elements.compactMap { $0 as? ImageElement }
    try container.encode(imageElements, forKey: .imageElements)
  }
}
